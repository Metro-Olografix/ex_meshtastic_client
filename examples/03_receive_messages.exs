#!/usr/bin/env elixir

# Receive messages example
# Shows two ways to receive: collect and stream
defmodule ReceiveMessages do
  require Logger

  def init do
    device_ip = "192.168.20.244"
    {:ok, conn} = MeshtasticClient.connect(type: :tcp, host: device_ip)
    IO.puts("Connected to #{device_ip}\n")

    conn
  end

  def method1 do
    # Method 1: Collect messages for a set time
    IO.puts("\nCollecting messages for 5 seconds...")
    messages = MeshtasticClient.collect_messages(timeout: 5000, count: 20)

    IO.puts("Received #{length(messages)} messages:\n")

    Enum.each(messages, fn msg ->
      case msg.payload_variant do
        {:my_info, info} ->
          IO.puts("  Device info: #{info.pio_env} (node: #{info.my_node_num})")

        {:node_info, node} ->
          IO.puts("  Node: #{node.user.long_name} (#{node.user.id})")

        {:channel, channel} ->
          IO.puts("  Channel #{channel.index}: #{channel.settings.name}")

        {:config, _config} ->
          IO.puts("  Config message")

        {:packet, packet} ->
          IO.puts("  Packet from #{packet.from} to #{packet.to}")

        {:metadata, meta} ->
          IO.puts("  Device metadata: firmware #{meta.firmware_version}")

        other ->
          IO.puts("  Other: #{inspect(elem(other, 0))}")
      end
    end)
  end

  def method2(conn) do
    # Method 2: Stream messages continuously
    IO.puts("\n\nNow listening for mesh traffic (Ctrl+C to exit)...")
    IO.puts("Send some messages from another device to see them here.\n")

    stream_messages(conn)
  end

  defp stream_messages(conn) do
    # Subscribe to receive messages
    MeshtasticClient.subscribe(conn)

    receive do
      {:meshtastic_message, msg} ->
        case msg.payload_variant do
          {:packet, %{payload_variant: {:decoded, data}}} when data.portnum == :TEXT_MESSAGE_APP ->
            IO.puts("[TEXT] #{data.payload}")

          {:packet, %{from: from, to: to}} ->
            IO.puts("[PACKET] #{from} -> #{to}")

          {:node_info, node} ->
            IO.puts("[NODE] #{node.user.long_name} heard")

          _other ->
            :ok
        end

        stream_messages(conn)
    end
  end
end

conn = ReceiveMessages.init()

# Method 1: Collect messages for a set time
# ReceiveMessages.method1()

# Method 2: Stream messages continuously
ReceiveMessages.method2(conn)




