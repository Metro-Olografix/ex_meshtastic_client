defmodule Meshtastic.ServiceEnvelope do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :packet, 1, type: Meshtastic.MeshPacket
  field :channel_id, 2, type: :string, json_name: "channelId"
  field :gateway_id, 3, type: :string, json_name: "gatewayId"
end

defmodule Meshtastic.MapReport do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :long_name, 1, type: :string, json_name: "longName"
  field :short_name, 2, type: :string, json_name: "shortName"
  field :role, 3, type: Meshtastic.Config.DeviceConfig.Role, enum: true
  field :hw_model, 4, type: Meshtastic.HardwareModel, json_name: "hwModel", enum: true
  field :firmware_version, 5, type: :string, json_name: "firmwareVersion"
  field :region, 6, type: Meshtastic.Config.LoRaConfig.RegionCode, enum: true

  field :modem_preset, 7,
    type: Meshtastic.Config.LoRaConfig.ModemPreset,
    json_name: "modemPreset",
    enum: true

  field :has_default_channel, 8, type: :bool, json_name: "hasDefaultChannel"
  field :latitude_i, 9, type: :sfixed32, json_name: "latitudeI"
  field :longitude_i, 10, type: :sfixed32, json_name: "longitudeI"
  field :altitude, 11, type: :int32
  field :position_precision, 12, type: :uint32, json_name: "positionPrecision"
  field :num_online_local_nodes, 13, type: :uint32, json_name: "numOnlineLocalNodes"
  field :has_opted_report_location, 14, type: :bool, json_name: "hasOptedReportLocation"
end
