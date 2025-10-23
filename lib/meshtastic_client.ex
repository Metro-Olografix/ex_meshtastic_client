defmodule MeshtasticClient do
  @moduledoc """
  A client for interacting with Meshtastic devices using Protocol Buffers.

  This client provides functionality to:
  - Connect to Meshtastic devices via TCP, Serial, or BLE
  - Encode and decode Meshtastic protobuf messages
  - Send and receive mesh packets
  - Manage device configuration
  """

  alias MeshtasticClient.Connection
  alias MeshtasticClient.Message

  @type connection :: Connection.t()
  @type error :: {:error, term()}

  @doc """
  Connects to a Meshtastic device.

  ## Options

    * `:type` - Connection type: `:tcp`, `:serial`, or `:ble` (default: `:tcp`)
    * `:host` - Host address for TCP connections (default: `"meshtastic.local"`)
    * `:port` - Port for TCP connections (default: `4403`)
    * `:device` - Device path for serial connections (e.g., `"/dev/ttyUSB0"`)
    * `:baud_rate` - Baud rate for serial connections (default: `115200`)

  ## Examples

      # Connect via TCP
      {:ok, conn} = MeshtasticClient.connect(type: :tcp, host: "192.168.1.100", port: 4403)

      # Connect via Serial
      {:ok, conn} = MeshtasticClient.connect(type: :serial, device: "/dev/ttyUSB0")
  """
  @spec connect(keyword()) :: {:ok, connection()} | error()
  def connect(opts \\ []) do
    Connection.connect(opts)
  end

  @doc """
  Disconnects from a Meshtastic device.
  """
  @spec disconnect(connection()) :: :ok | error()
  def disconnect(conn) do
    Connection.disconnect(conn)
  end

  @doc """
  Sends a text message to a specific node or broadcast.

  ## Options

    * `:to` - Destination node ID (default: `0xFFFFFFFF` for broadcast)
    * `:channel` - Channel index (default: `0`)
    * `:want_ack` - Request acknowledgment (default: `false`)

  ## Examples

      MeshtasticClient.send_text(conn, "Hello, mesh!", to: 0x12345678)
      MeshtasticClient.send_text(conn, "Broadcast message")
  """
  @spec send_text(connection(), String.t(), keyword()) :: :ok | error()
  def send_text(conn, text, opts \\ []) do
    Message.send_text(conn, text, opts)
  end

  @doc """
  Sends a position update.

  ## Options

    * `:latitude` - Latitude in degrees
    * `:longitude` - Longitude in degrees
    * `:altitude` - Altitude in meters
    * `:to` - Destination node ID (default: broadcast)
    * `:channel` - Channel index (default: `0`)
  """
  @spec send_position(connection(), keyword()) :: :ok | error()
  def send_position(conn, opts \\ []) do
    Message.send_position(conn, opts)
  end

  @doc """
  Requests the device configuration.
  """
  @spec get_config(connection()) :: {:ok, map()} | error()
  def get_config(conn) do
    Message.get_config(conn)
  end

  @doc """
  Subscribes to incoming messages from the device.

  Returns a stream of messages that can be consumed.
  """
  @spec subscribe(connection()) :: Enumerable.t()
  def subscribe(conn) do
    Connection.subscribe(conn)
  end

  @doc """
  Gets information about the local node.

  This function requests configuration and then listens for responses.
  You should subscribe first to receive the responses asynchronously.

  ## Example

      MeshtasticClient.subscribe(conn)

      # Then receive messages
      receive do
        {:meshtastic_message, msg} -> IO.inspect(msg)
      after
        5000 -> :timeout
      end
  """
  @spec get_node_info(connection()) :: {:ok, map()} | error()
  def get_node_info(conn) do
    Message.get_node_info(conn)
  end

  @doc """
  Waits for and collects incoming messages for a specified timeout.

  ## Options

    * `:timeout` - Timeout in milliseconds (default: 5000)
    * `:count` - Number of messages to collect (default: 10)

  ## Example

      MeshtasticClient.subscribe(conn)
      messages = MeshtasticClient.collect_messages(timeout: 3000)
  """
  @spec collect_messages(keyword()) :: [term()]
  def collect_messages(opts \\ []) do
    timeout = Keyword.get(opts, :timeout, 5000)
    count = Keyword.get(opts, :count, 10)

    collect_messages_loop([], count, timeout)
  end

  defp collect_messages_loop(acc, 0, _timeout), do: Enum.reverse(acc)

  defp collect_messages_loop(acc, remaining, timeout) do
    receive do
      {:meshtastic_message, msg} ->
        collect_messages_loop([msg | acc], remaining - 1, timeout)
    after
      timeout -> Enum.reverse(acc)
    end
  end
end
