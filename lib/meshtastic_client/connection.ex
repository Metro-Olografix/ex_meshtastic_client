defmodule MeshtasticClient.Connection do
  @moduledoc """
  Handles connection management for Meshtastic devices.
  """

  use GenServer
  require Logger

  @type t :: %__MODULE__{
          type: :tcp | :serial | :ble,
          socket: port() | nil,
          subscribers: [pid()],
          buffer: binary()
        }

  defstruct [:type, :socket, subscribers: [], buffer: <<>>]

  ## Client API

  @doc """
  Connects to a Meshtastic device.
  """
  def connect(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @doc """
  Disconnects from the device.
  """
  def disconnect(conn) do
    GenServer.stop(conn)
  end

  @doc """
  Sends raw data to the device.
  """
  def send_data(conn, data) do
    GenServer.call(conn, {:send, data})
  end

  @doc """
  Subscribes to incoming messages.
  """
  def subscribe(conn) do
    GenServer.call(conn, :subscribe)
  end

  ## GenServer Callbacks

  @impl true
  def init(opts) do
    type = Keyword.get(opts, :type, :tcp)

    case type do
      :tcp ->
        init_tcp(opts)

      :serial ->
        {:error, :serial_not_implemented}

      :ble ->
        {:error, :ble_not_implemented}
    end
  end

  @impl true
  def handle_call({:send, data}, _from, state) do
    case send_to_device(state, data) do
      :ok ->
        {:reply, :ok, state}

      {:error, reason} ->
        {:reply, {:error, reason}, state}
    end
  end

  def handle_call(:subscribe, {pid, _}, state) do
    Process.monitor(pid)
    new_state = %{state | subscribers: [pid | state.subscribers]}
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_info({:tcp, socket, data}, %{socket: socket} = state) do
    Logger.debug("Received #{byte_size(data)} bytes from device")
    new_state = process_incoming_data(state, data)
    {:noreply, new_state}
  end

  def handle_info({:tcp_closed, socket}, %{socket: socket} = state) do
    Logger.warning("TCP connection closed")
    {:stop, :normal, state}
  end

  def handle_info({:tcp_error, socket, reason}, %{socket: socket} = state) do
    Logger.error("TCP error: #{inspect(reason)}")
    {:stop, reason, state}
  end

  def handle_info({:DOWN, _ref, :process, pid, _reason}, state) do
    new_state = %{state | subscribers: List.delete(state.subscribers, pid)}
    {:noreply, new_state}
  end

  @impl true
  def terminate(_reason, %{socket: socket, type: :tcp}) when socket != nil do
    :gen_tcp.close(socket)
    :ok
  end

  def terminate(_reason, _state), do: :ok

  ## Private Functions

  defp init_tcp(opts) do
    host = Keyword.get(opts, :host, "meshtastic.local") |> to_charlist()
    port = Keyword.get(opts, :port, 4403)

    case :gen_tcp.connect(host, port, [:binary, active: true, packet: :raw]) do
      {:ok, socket} ->
        Logger.info("Connected to Meshtastic device via TCP at #{host}:#{port}")
        {:ok, %__MODULE__{type: :tcp, socket: socket}}

      {:error, reason} ->
        Logger.error("Failed to connect via TCP: #{inspect(reason)}")
        {:stop, reason}
    end
  end

  defp send_to_device(%{type: :tcp, socket: socket}, data) do
    Logger.debug("Sending #{byte_size(data)} bytes to device")
    Logger.debug("Data: #{inspect(data, limit: :infinity)}")
    :gen_tcp.send(socket, data)
  end

  defp process_incoming_data(state, data) do
    buffer = state.buffer <> data

    case decode_meshtastic_frame(buffer) do
      {:ok, message, rest} ->
        notify_subscribers(state, message)
        %{state | buffer: rest}

      :incomplete ->
        %{state | buffer: buffer}
    end
  end

  defp decode_meshtastic_frame(<<0x94, 0xC3, length::16-big, payload::binary>>) do
    if byte_size(payload) >= length do
      <<frame::binary-size(length), rest::binary>> = payload
      {:ok, frame, rest}
    else
      :incomplete
    end
  end

  defp decode_meshtastic_frame(_), do: :incomplete

  defp notify_subscribers(state, message) do
    # Decode the FromRadio message
    from_radio = Protobuf.decode(message, Meshtastic.FromRadio)
    Logger.debug("Received FromRadio: #{inspect(from_radio, limit: 5)}")

    Enum.each(state.subscribers, fn pid ->
      send(pid, {:meshtastic_message, from_radio})
    end)
  end
end
