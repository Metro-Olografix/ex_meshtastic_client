#!/usr/bin/env elixir

# Send text messages example
# Demonstrates broadcasting and direct messaging

device_ip = "192.168.1.100"

{:ok, conn} = MeshtasticClient.connect(type: :tcp, host: device_ip)
IO.puts("Connected to #{device_ip}")

# Example 1: Broadcast to all nodes
IO.puts("\n--- Broadcasting message ---")
MeshtasticClient.send_text(conn, "Hello from Elixir!")
IO.puts("Sent broadcast message")

Process.sleep(1000)

# Example 2: Send to specific node with acknowledgment
IO.puts("\n--- Sending direct message ---")
target_node = 0x813d0c84  # Replace with actual node ID

MeshtasticClient.send_text(
  conn,
  "Direct message to you!",
  to: target_node,
  want_ack: true
)
IO.puts("Sent direct message to node #{Integer.to_string(target_node, 16)}")

Process.sleep(1000)

# Example 3: Send on specific channel
IO.puts("\n--- Sending on channel 1 ---")
MeshtasticClient.send_text(
  conn,
  "Message on channel 1",
  channel: 1
)
IO.puts("Sent message on channel 1")

Process.sleep(1000)

MeshtasticClient.disconnect(conn)
IO.puts("\nDisconnected")
