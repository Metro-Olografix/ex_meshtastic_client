defmodule Meshtastic.PositionLite do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :latitude_i, 1, type: :sfixed32, json_name: "latitudeI"
  field :longitude_i, 2, type: :sfixed32, json_name: "longitudeI"
  field :altitude, 3, type: :int32
  field :time, 4, type: :fixed32

  field :location_source, 5,
    type: Meshtastic.Position.LocSource,
    json_name: "locationSource",
    enum: true
end

defmodule Meshtastic.UserLite do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :macaddr, 1, type: :bytes, deprecated: true
  field :long_name, 2, type: :string, json_name: "longName"
  field :short_name, 3, type: :string, json_name: "shortName"
  field :hw_model, 4, type: Meshtastic.HardwareModel, json_name: "hwModel", enum: true
  field :is_licensed, 5, type: :bool, json_name: "isLicensed"
  field :role, 6, type: Meshtastic.Config.DeviceConfig.Role, enum: true
  field :public_key, 7, type: :bytes, json_name: "publicKey"
  field :is_unmessagable, 9, proto3_optional: true, type: :bool, json_name: "isUnmessagable"
end

defmodule Meshtastic.NodeInfoLite do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :num, 1, type: :uint32
  field :user, 2, type: Meshtastic.UserLite
  field :position, 3, type: Meshtastic.PositionLite
  field :snr, 4, type: :float
  field :last_heard, 5, type: :fixed32, json_name: "lastHeard"
  field :device_metrics, 6, type: Meshtastic.DeviceMetrics, json_name: "deviceMetrics"
  field :channel, 7, type: :uint32
  field :via_mqtt, 8, type: :bool, json_name: "viaMqtt"
  field :hops_away, 9, proto3_optional: true, type: :uint32, json_name: "hopsAway"
  field :is_favorite, 10, type: :bool, json_name: "isFavorite"
  field :is_ignored, 11, type: :bool, json_name: "isIgnored"
  field :next_hop, 12, type: :uint32, json_name: "nextHop"
  field :bitfield, 13, type: :uint32
end

defmodule Meshtastic.DeviceState do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :my_node, 2, type: Meshtastic.MyNodeInfo, json_name: "myNode"
  field :owner, 3, type: Meshtastic.User
  field :receive_queue, 5, repeated: true, type: Meshtastic.MeshPacket, json_name: "receiveQueue"
  field :version, 8, type: :uint32
  field :rx_text_message, 7, type: Meshtastic.MeshPacket, json_name: "rxTextMessage"
  field :no_save, 9, type: :bool, json_name: "noSave", deprecated: true
  field :did_gps_reset, 11, type: :bool, json_name: "didGpsReset", deprecated: true
  field :rx_waypoint, 12, type: Meshtastic.MeshPacket, json_name: "rxWaypoint"

  field :node_remote_hardware_pins, 13,
    repeated: true,
    type: Meshtastic.NodeRemoteHardwarePin,
    json_name: "nodeRemoteHardwarePins"
end

defmodule Meshtastic.NodeDatabase do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version, 1, type: :uint32
  field :nodes, 2, repeated: true, type: Meshtastic.NodeInfoLite, deprecated: false
end

defmodule Meshtastic.ChannelFile do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :channels, 1, repeated: true, type: Meshtastic.Channel
  field :version, 2, type: :uint32
end

defmodule Meshtastic.BackupPreferences do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version, 1, type: :uint32
  field :timestamp, 2, type: :fixed32
  field :config, 3, type: Meshtastic.LocalConfig
  field :module_config, 4, type: Meshtastic.LocalModuleConfig, json_name: "moduleConfig"
  field :channels, 5, type: Meshtastic.ChannelFile
  field :owner, 6, type: Meshtastic.User
end
