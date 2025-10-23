defmodule MeshtasticClient.Message do
  @moduledoc """
  Handles encoding and decoding of Meshtastic protobuf messages.
  """

  alias MeshtasticClient.Connection
  alias Meshtastic.{ToRadio, MeshPacket, Data, Position}

  @magic_header <<0x94, 0xC3>>

  @doc """
  Sends a text message.
  """
  def send_text(conn, text, opts \\ []) do
    to = Keyword.get(opts, :to, 0xFFFFFFFF)
    channel = Keyword.get(opts, :channel, 0)
    want_ack = Keyword.get(opts, :want_ack, false)

    # Build a text message packet using actual protobuf structures
    data = %Data{
      portnum: :TEXT_MESSAGE_APP,
      payload: text,
      want_response: want_ack
    }

    packet = %MeshPacket{
      to: to,
      channel: channel,
      payload_variant: {:decoded, data},
      want_ack: want_ack,
      id: generate_packet_id()
    }

    send_packet(conn, packet)
  end

  @doc """
  Sends a position update.
  """
  def send_position(conn, opts \\ []) do
    latitude = Keyword.get(opts, :latitude, 0.0)
    longitude = Keyword.get(opts, :longitude, 0.0)
    altitude = Keyword.get(opts, :altitude, 0)
    to = Keyword.get(opts, :to, 0xFFFFFFFF)
    channel = Keyword.get(opts, :channel, 0)

    # Convert to Meshtastic format (1e-7 degrees)
    latitude_i = round(latitude * 10_000_000)
    longitude_i = round(longitude * 10_000_000)

    position = %Position{
      latitude_i: latitude_i,
      longitude_i: longitude_i,
      altitude: altitude,
      time: System.os_time(:second)
    }

    position_payload = Protobuf.encode(position)

    data = %Data{
      portnum: :POSITION_APP,
      payload: position_payload
    }

    packet = %MeshPacket{
      to: to,
      channel: channel,
      payload_variant: {:decoded, data},
      id: generate_packet_id()
    }

    send_packet(conn, packet)
  end

  @doc """
  Requests device configuration.
  This sends a want_config_id request to the device which will respond
  with configuration, node info, and other device state.

  Start with config_id 0 to initiate the handshake and get all configuration.
  """
  def get_config(conn) do
    # Start with 0 to request all configuration from the beginning
    to_radio = %ToRadio{payload_variant: {:want_config_id, 0}}
    encoded = Protobuf.encode(to_radio)
    frame = build_frame(encoded)

    Connection.send_data(conn, frame)
  end

  @doc """
  Gets local node information.
  This is typically sent automatically after connecting.
  """
  def get_node_info(conn) do
    # Request configuration which includes node info
    get_config(conn)
  end

  @doc """
  Encodes and sends a packet to the device.
  """
  def send_packet(conn, packet) do
    to_radio = %ToRadio{payload_variant: {:packet, packet}}
    encoded = Protobuf.encode(to_radio)
    frame = build_frame(encoded)

    Connection.send_data(conn, frame)
  end

  @doc """
  Decodes a received packet from the device.
  """
  def decode_packet(data) do
    case Protobuf.decode(data, Meshtastic.FromRadio) do
      {:ok, from_radio} -> {:ok, from_radio}
      {:error, reason} -> {:error, reason}
    end
  end

  ## Private Functions

  defp generate_packet_id do
    :rand.uniform(0xFFFFFFFF)
  end

  defp build_frame(payload) do
    length = byte_size(payload)
    # Use big-endian (network byte order) like Python implementation
    @magic_header <> <<length::16-big>> <> payload
  end
end
