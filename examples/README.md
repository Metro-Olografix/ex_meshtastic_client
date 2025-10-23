# Examples

Practical examples for using the Meshtastic client.

## Running Examples

Make sure you've set up the library first (see main README). Then run any example with:

```bash
mix run examples/01_basic_connection.exs
```

**Important:** Update the `device_ip` variable in each script to match your device's IP address.

## Examples

### 01_basic_connection.exs

Simple connection test. Connects to a device and verifies connectivity.

Good first test to make sure your network setup is correct.

### 02_send_text.exs

Sending text messages three ways:
- Broadcast to all nodes
- Direct message to specific node
- Message on a specific channel

### 03_receive_messages.exs

Two approaches to receiving messages:

1. **Collect mode** - Gather messages for a set time period
2. **Stream mode** - Handle messages as they arrive

Shows how to parse different message types (node info, packets, config, etc).

### 04_position_tracking.exs

Position updates:
- Send your location to the mesh
- Listen for position reports from other nodes
- Parse latitude/longitude from different message types

### 05_mesh_monitor.exs

Live mesh monitor that displays:
- Node discoveries
- Channel information
- Text messages
- Position updates
- Telemetry
- All mesh activity

Run this to watch what's happening on your mesh network.

## Tips

- Use `Logger.configure(level: :debug)` at the top of scripts to see protocol details
- Most examples run until you press Ctrl+C
- The device takes ~1-2 seconds after connection to start responding
- Use `MeshtasticClient.get_config(conn)` to trigger device responses
