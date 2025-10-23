#!/usr/bin/env elixir

# Basic connection example
# Shows how to connect to a Meshtastic device and verify connectivity

# Change this to your device's IP
device_ip = "192.168.1.100"

IO.puts("Connecting to Meshtastic device at #{device_ip}...")

case MeshtasticClient.connect(type: :tcp, host: device_ip) do
  {:ok, conn} ->
    IO.puts("Connected successfully!")
    IO.puts("Connection PID: #{inspect(conn)}")

    # Keep connection open for a moment
    Process.sleep(1000)

    # Clean disconnect
    IO.puts("Disconnecting...")
    MeshtasticClient.disconnect(conn)
    IO.puts("Done.")

  {:error, reason} ->
    IO.puts("Connection failed: #{inspect(reason)}")
    IO.puts("\nMake sure:")
    IO.puts("  1. Your device is powered on")
    IO.puts("  2. You're on the same network")
    IO.puts("  3. The IP address is correct")
    IO.puts("  4. Port 4403 is open")
end
