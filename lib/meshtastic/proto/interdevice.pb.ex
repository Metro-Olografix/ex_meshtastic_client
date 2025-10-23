defmodule Meshtastic.MessageType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ACK, 0
  field :COLLECT_INTERVAL, 160
  field :BEEP_ON, 161
  field :BEEP_OFF, 162
  field :SHUTDOWN, 163
  field :POWER_ON, 164
  field :SCD41_TEMP, 176
  field :SCD41_HUMIDITY, 177
  field :SCD41_CO2, 178
  field :AHT20_TEMP, 179
  field :AHT20_HUMIDITY, 180
  field :TVOC_INDEX, 181
end

defmodule Meshtastic.SensorData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :data, 0

  field :type, 1, type: Meshtastic.MessageType, enum: true
  field :float_value, 2, type: :float, json_name: "floatValue", oneof: 0
  field :uint32_value, 3, type: :uint32, json_name: "uint32Value", oneof: 0
end

defmodule Meshtastic.InterdeviceMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :data, 0

  field :nmea, 1, type: :string, oneof: 0
  field :sensor, 2, type: Meshtastic.SensorData, oneof: 0
end
