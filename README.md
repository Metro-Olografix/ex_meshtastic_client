# Meshtastic Client (WIP)

![Hex.pm Version](https://img.shields.io/hexpm/v/meshtastic_client)
![Hex.pm Docs](https://img.shields.io/hexpm/v/meshtastic_client?label=hexdocs&link=https%3A%2F%2Fhexdocs.pm%2Fmeshtastic_client%2Fapi-reference.html)

Elixir client for Meshtastic devices. Connects over TCP to send and receive mesh network messages using Protobuf.

## Installation

Add to your `mix.exs`:

```elixir
def deps do
  [
    {:meshtastic_client, "~> 0.1.0"}
  ]
end
```

Then run `mix deps.get` to install.

## Quick Start

```elixir
# Connect to your device
{:ok, conn} = MeshtasticClient.connect(type: :tcp, host: "192.168.1.100")

# Subscribe to incoming messages
MeshtasticClient.subscribe(conn)

# Send a message to the mesh
MeshtasticClient.send_text(conn, "Hello from Elixir!")

# Collect messages
messages = MeshtasticClient.collect_messages(timeout: 5000)
IO.inspect(messages)
```

See the `examples/` directory for more usage patterns.

> [!NOTE]
> Protobuf client is generated automatically but not all features are available on the Elixir client

## Setup

This library uses Meshtastic's protobuf definitions. You'll need `protoc` installed to generate the Elixir modules:

```bash
# Fedora/RHEL
sudo dnf install protobuf-compiler protobuf-devel

# Ubuntu/Debian
sudo apt-get install protobuf-compiler protobuf-devel

# macOS
brew install protobuf
```

Install the Elixir protobuf plugin:
```bash
mix escript.install hex protobuf 0.14.0
```

The protobuf files are in `priv/protos/`. Generate modules using the Mix task:
```bash
mix protobuf.gen
```

To regenerate all modules from scratch:
```bash
mix protobuf.gen --clean
```

## Connections

### TCP

Most Meshtastic devices expose TCP on port 4403:

```elixir
{:ok, conn} = MeshtasticClient.connect(
  type: :tcp,
  host: "192.168.1.100",
  port: 4403  # default
)
```

### Serial & BLE

Not implemented yet.

## Sending Messages

### Text Messages

```elixir
# Broadcast to all nodes
MeshtasticClient.send_text(conn, "Hello mesh!")

# Send to specific node
MeshtasticClient.send_text(conn, "Direct message", to: 0x12345678, want_ack: true)

# Send on channel 1
MeshtasticClient.send_text(conn, "Channel message", channel: 1)
```

### Position Updates

```elixir
MeshtasticClient.send_position(conn,
  latitude: 37.7749,
  longitude: -122.4194,
  altitude: 15
)
```

## Receiving Messages

Two approaches: collect or stream.

### Collect Messages

Gather messages for a set time:

```elixir
MeshtasticClient.subscribe(conn)

messages = MeshtasticClient.collect_messages(timeout: 5000, count: 10)
Enum.each(messages, &IO.inspect/1)
```

### Stream Messages

Handle messages as they arrive:

```elixir
MeshtasticClient.subscribe(conn)

receive do
  {:meshtastic_message, %{payload_variant: {:packet, packet}}} ->
    IO.puts("Got packet: #{inspect(packet)}")
end
```

## Device Info

Request configuration and node details:

```elixir
# Triggers config response messages
MeshtasticClient.get_config(conn)

# Same as get_config
MeshtasticClient.get_node_info(conn)
```

These functions send requests; responses arrive as messages you receive via subscription.

## Client architecture

- `MeshtasticClient` - Public API
- `MeshtasticClient.Connection` - TCP connection manager (GenServer)
- `MeshtasticClient.Message` - Message encoding/framing
- `Meshtastic.*` - Generated protobuf structs (mesh.proto, config.proto, etc.)

## Message Types

When you receive messages, check the `payload_variant` field:

```elixir
case message.payload_variant do
  {:my_info, info} -> # Device node info
  {:node_info, node} -> # Other node discovered
  {:packet, packet} -> # Mesh packet (text, telemetry, etc.)
  {:config, config} -> # Device config
  {:channel, channel} -> # Channel settings
  _ -> # Other message types
end
```

## References

- [Meshtastic docs](https://meshtastic.org/docs/)
- [Protobuf specs](https://buf.build/meshtastic/protobufs)
- [Protocol details](https://github.com/meshtastic/protobufs)
