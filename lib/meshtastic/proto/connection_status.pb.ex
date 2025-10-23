defmodule Meshtastic.DeviceConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :wifi, 1, proto3_optional: true, type: Meshtastic.WifiConnectionStatus
  field :ethernet, 2, proto3_optional: true, type: Meshtastic.EthernetConnectionStatus
  field :bluetooth, 3, proto3_optional: true, type: Meshtastic.BluetoothConnectionStatus
  field :serial, 4, proto3_optional: true, type: Meshtastic.SerialConnectionStatus
end

defmodule Meshtastic.WifiConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Meshtastic.NetworkConnectionStatus
  field :ssid, 2, type: :string
  field :rssi, 3, type: :int32
end

defmodule Meshtastic.EthernetConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Meshtastic.NetworkConnectionStatus
end

defmodule Meshtastic.NetworkConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ip_address, 1, type: :fixed32, json_name: "ipAddress"
  field :is_connected, 2, type: :bool, json_name: "isConnected"
  field :is_mqtt_connected, 3, type: :bool, json_name: "isMqttConnected"
  field :is_syslog_connected, 4, type: :bool, json_name: "isSyslogConnected"
end

defmodule Meshtastic.BluetoothConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :pin, 1, type: :uint32
  field :rssi, 2, type: :int32
  field :is_connected, 3, type: :bool, json_name: "isConnected"
end

defmodule Meshtastic.SerialConnectionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :baud, 1, type: :uint32
  field :is_connected, 2, type: :bool, json_name: "isConnected"
end
