defmodule Meshtastic.CompassMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DYNAMIC, 0
  field :FIXED_RING, 1
  field :FREEZE_HEADING, 2
end

defmodule Meshtastic.Theme do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DARK, 0
  field :LIGHT, 1
  field :RED, 2
end

defmodule Meshtastic.Language do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ENGLISH, 0
  field :FRENCH, 1
  field :GERMAN, 2
  field :ITALIAN, 3
  field :PORTUGUESE, 4
  field :SPANISH, 5
  field :SWEDISH, 6
  field :FINNISH, 7
  field :POLISH, 8
  field :TURKISH, 9
  field :SERBIAN, 10
  field :RUSSIAN, 11
  field :DUTCH, 12
  field :GREEK, 13
  field :NORWEGIAN, 14
  field :SLOVENIAN, 15
  field :UKRAINIAN, 16
  field :BULGARIAN, 17
  field :CZECH, 18
  field :DANISH, 19
  field :SIMPLIFIED_CHINESE, 30
  field :TRADITIONAL_CHINESE, 31
end

defmodule Meshtastic.DeviceUIConfig.GpsCoordinateFormat do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEC, 0
  field :DMS, 1
  field :UTM, 2
  field :MGRS, 3
  field :OLC, 4
  field :OSGR, 5
  field :MLS, 6
end

defmodule Meshtastic.DeviceUIConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version, 1, type: :uint32
  field :screen_brightness, 2, type: :uint32, json_name: "screenBrightness"
  field :screen_timeout, 3, type: :uint32, json_name: "screenTimeout"
  field :screen_lock, 4, type: :bool, json_name: "screenLock"
  field :settings_lock, 5, type: :bool, json_name: "settingsLock"
  field :pin_code, 6, type: :uint32, json_name: "pinCode"
  field :theme, 7, type: Meshtastic.Theme, enum: true
  field :alert_enabled, 8, type: :bool, json_name: "alertEnabled"
  field :banner_enabled, 9, type: :bool, json_name: "bannerEnabled"
  field :ring_tone_id, 10, type: :uint32, json_name: "ringToneId"
  field :language, 11, type: Meshtastic.Language, enum: true
  field :node_filter, 12, type: Meshtastic.NodeFilter, json_name: "nodeFilter"
  field :node_highlight, 13, type: Meshtastic.NodeHighlight, json_name: "nodeHighlight"
  field :calibration_data, 14, type: :bytes, json_name: "calibrationData"
  field :map_data, 15, type: Meshtastic.Map, json_name: "mapData"
  field :compass_mode, 16, type: Meshtastic.CompassMode, json_name: "compassMode", enum: true
  field :screen_rgb_color, 17, type: :uint32, json_name: "screenRgbColor"
  field :is_clockface_analog, 18, type: :bool, json_name: "isClockfaceAnalog"

  field :gps_format, 19,
    type: Meshtastic.DeviceUIConfig.GpsCoordinateFormat,
    json_name: "gpsFormat",
    enum: true
end

defmodule Meshtastic.NodeFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :unknown_switch, 1, type: :bool, json_name: "unknownSwitch"
  field :offline_switch, 2, type: :bool, json_name: "offlineSwitch"
  field :public_key_switch, 3, type: :bool, json_name: "publicKeySwitch"
  field :hops_away, 4, type: :int32, json_name: "hopsAway"
  field :position_switch, 5, type: :bool, json_name: "positionSwitch"
  field :node_name, 6, type: :string, json_name: "nodeName"
  field :channel, 7, type: :int32
end

defmodule Meshtastic.NodeHighlight do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :chat_switch, 1, type: :bool, json_name: "chatSwitch"
  field :position_switch, 2, type: :bool, json_name: "positionSwitch"
  field :telemetry_switch, 3, type: :bool, json_name: "telemetrySwitch"
  field :iaq_switch, 4, type: :bool, json_name: "iaqSwitch"
  field :node_name, 5, type: :string, json_name: "nodeName"
end

defmodule Meshtastic.GeoPoint do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :zoom, 1, type: :int32
  field :latitude, 2, type: :int32
  field :longitude, 3, type: :int32
end

defmodule Meshtastic.Map do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :home, 1, type: Meshtastic.GeoPoint
  field :style, 2, type: :string
  field :follow_gps, 3, type: :bool, json_name: "followGps"
end
