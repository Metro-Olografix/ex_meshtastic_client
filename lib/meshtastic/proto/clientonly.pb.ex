defmodule Meshtastic.DeviceProfile do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :long_name, 1, proto3_optional: true, type: :string, json_name: "longName"
  field :short_name, 2, proto3_optional: true, type: :string, json_name: "shortName"
  field :channel_url, 3, proto3_optional: true, type: :string, json_name: "channelUrl"
  field :config, 4, proto3_optional: true, type: Meshtastic.LocalConfig

  field :module_config, 5,
    proto3_optional: true,
    type: Meshtastic.LocalModuleConfig,
    json_name: "moduleConfig"

  field :fixed_position, 6,
    proto3_optional: true,
    type: Meshtastic.Position,
    json_name: "fixedPosition"

  field :ringtone, 7, proto3_optional: true, type: :string
  field :canned_messages, 8, proto3_optional: true, type: :string, json_name: "cannedMessages"
end
