#!/usr/bin/env elixir

# Position tracking example
# Sends position updates and listens for position reports from other nodes

defmodule PositionTracking do
  def run do
    device_ip = "192.168.1.100"

    {:ok, conn} = MeshtasticClient.connect(type: :tcp, host: device_ip)
    IO.puts("Connected to #{device_ip}\n")

    MeshtasticClient.subscribe(conn)

    # Send a position update
    latitude = 37.7749
    longitude = -122.4194
    altitude = 15

    IO.puts("Sending position update:")
    IO.puts("  Lat: #{latitude}")
    IO.puts("  Lon: #{longitude}")
    IO.puts("  Alt: #{altitude}m\n")

    # MeshtasticClient.send_position(conn,
    #   latitude: latitude,
    #   longitude: longitude,
    #   altitude: altitude
    # )

    # Listen for position reports from other nodes
    IO.puts("Listening for position reports from mesh (Ctrl+C to exit)...\n")

    listen_for_positions()
  end

  defp listen_for_positions do
    receive do
      {:meshtastic_message, %{payload_variant: {:node_info, node}}} ->
        if node.position do
          pos = node.position
          lat = pos.latitude_i / 10_000_000
          lon = pos.longitude_i / 10_000_000

          IO.puts("#{node.user.long_name} (#{node.user.short_name}):")
          IO.puts("  Position: #{lat}, #{lon}")

          if pos.altitude do
            IO.puts("  Altitude: #{pos.altitude}m")
          end

          if pos.time do
            IO.puts("  Time: #{pos.time}")
          end

          IO.puts("")
        end

        listen_for_positions()

      {:meshtastic_message, %{payload_variant: {:packet, packet}}} ->
        case packet.payload_variant do
          {:decoded, %{portnum: :POSITION_APP, payload: payload}} ->
            # Decode position from packet
            case Protobuf.decode(payload, Meshtastic.Position) do
              pos when is_struct(pos) ->
                lat = pos.latitude_i / 10_000_000
                lon = pos.longitude_i / 10_000_000
                IO.puts("Position packet from node #{packet.from}:")
                IO.puts("  #{lat}, #{lon}\n")

              _ ->
                :ok
            end

            listen_for_positions()

          _ ->
            listen_for_positions()
        end

      _ ->
        listen_for_positions()
    end
  end

end

PositionTracking.run()