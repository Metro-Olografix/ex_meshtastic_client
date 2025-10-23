#!/usr/bin/env elixir

# Mesh monitor example
# Monitors all mesh activity and displays a live feed

defmodule MeshMonitor do

  def run do
    device_ip = "192.168.1.100"

    IO.puts("Meshtastic Mesh Monitor")
    IO.puts("=" |> String.duplicate(50))
    IO.puts("")

    {:ok, conn} = MeshtasticClient.connect(type: :tcp, host: device_ip)
    MeshtasticClient.subscribe(conn)
    MeshtasticClient.get_config(conn)

    IO.puts("Connected. Monitoring mesh activity...\n")

    monitor_loop(%{nodes: %{}, channels: %{}})
  end

  defp monitor_loop(state) do
    receive do
      {:meshtastic_message, msg} ->
        new_state = handle_message(msg, state)
        monitor_loop(new_state)
    end
  end

  defp handle_message(%{payload_variant: {:my_info, info}}, state) do
    IO.puts("[DEVICE] Local node: #{info.my_node_num}")
    state
  end

  defp handle_message(%{payload_variant: {:node_info, node}}, state) do
    node_id = node.num
    name = node.user.long_name

    unless Map.has_key?(state.nodes, node_id) do
      IO.puts("[NODE] New: #{name} (#{node.user.id})")
    end

    %{state | nodes: Map.put(state.nodes, node_id, node)}
  end

  defp handle_message(%{payload_variant: {:channel, channel}}, state) do
    idx = channel.index
    name = channel.settings.name

    unless Map.has_key?(state.channels, idx) do
      if name != "" do
        IO.puts("[CHANNEL] #{idx}: #{name} (#{channel.role})")
      end
    end

    %{state | channels: Map.put(state.channels, idx, channel)}
  end

  defp handle_message(%{payload_variant: {:packet, packet}}, state) do
    from = Map.get(state.nodes, packet.from)
    from_name = if from, do: from.user.short_name, else: "?"

    case packet.payload_variant do
      {:decoded, data} ->
        case data.portnum do
          :TEXT_MESSAGE_APP ->
            IO.puts("[TEXT] #{from_name}: #{data.payload}")

          :POSITION_APP ->
            IO.puts("[POS] #{from_name} shared location")

          :NODEINFO_APP ->
            IO.puts("[INFO] #{from_name} sent node info")

          :TELEMETRY_APP ->
            IO.puts("[TELEM] #{from_name} sent telemetry")

          :ROUTING_APP ->
            # Usually routing ACKs, less interesting
            :ok

          other ->
            IO.puts("[#{other}] #{from_name}")
        end

      {:encrypted, _} ->
        IO.puts("[ENCRYPTED] #{from_name} (can't decrypt)")

      _ ->
        :ok
    end

    state
  end

  defp handle_message(%{payload_variant: {:metadata, meta}}, state) do
    IO.puts("[DEVICE] Firmware: #{meta.firmware_version}")
    state
  end

  defp handle_message(_msg, state) do
    state
  end
end

Logger.configure(level: :info)
MeshMonitor.run()
