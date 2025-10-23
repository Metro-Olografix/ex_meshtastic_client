defmodule Meshtastic.Channel.Role do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DISABLED, 0
  field :PRIMARY, 1
  field :SECONDARY, 2
end

defmodule Meshtastic.ChannelSettings do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :channel_num, 1, type: :uint32, json_name: "channelNum", deprecated: true
  field :psk, 2, type: :bytes
  field :name, 3, type: :string
  field :id, 4, type: :fixed32
  field :uplink_enabled, 5, type: :bool, json_name: "uplinkEnabled"
  field :downlink_enabled, 6, type: :bool, json_name: "downlinkEnabled"
  field :module_settings, 7, type: Meshtastic.ModuleSettings, json_name: "moduleSettings"
end

defmodule Meshtastic.ModuleSettings do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :position_precision, 1, type: :uint32, json_name: "positionPrecision"
  field :is_muted, 2, type: :bool, json_name: "isMuted"
end

defmodule Meshtastic.Channel do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :index, 1, type: :int32
  field :settings, 2, type: Meshtastic.ChannelSettings
  field :role, 3, type: Meshtastic.Channel.Role, enum: true
end
