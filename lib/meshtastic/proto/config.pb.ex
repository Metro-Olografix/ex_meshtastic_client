defmodule Meshtastic.Config.DeviceConfig.Role do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :CLIENT, 0
  field :CLIENT_MUTE, 1
  field :ROUTER, 2
  field :ROUTER_CLIENT, 3
  field :REPEATER, 4
  field :TRACKER, 5
  field :SENSOR, 6
  field :TAK, 7
  field :CLIENT_HIDDEN, 8
  field :LOST_AND_FOUND, 9
  field :TAK_TRACKER, 10
  field :ROUTER_LATE, 11
  field :CLIENT_BASE, 12
end

defmodule Meshtastic.Config.DeviceConfig.RebroadcastMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALL, 0
  field :ALL_SKIP_DECODING, 1
  field :LOCAL_ONLY, 2
  field :KNOWN_ONLY, 3
  field :NONE, 4
  field :CORE_PORTNUMS_ONLY, 5
end

defmodule Meshtastic.Config.DeviceConfig.BuzzerMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALL_ENABLED, 0
  field :DISABLED, 1
  field :NOTIFICATIONS_ONLY, 2
  field :SYSTEM_ONLY, 3
  field :DIRECT_MSG_ONLY, 4
end

defmodule Meshtastic.Config.PositionConfig.PositionFlags do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :ALTITUDE, 1
  field :ALTITUDE_MSL, 2
  field :GEOIDAL_SEPARATION, 4
  field :DOP, 8
  field :HVDOP, 16
  field :SATINVIEW, 32
  field :SEQ_NO, 64
  field :TIMESTAMP, 128
  field :HEADING, 256
  field :SPEED, 512
end

defmodule Meshtastic.Config.PositionConfig.GpsMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DISABLED, 0
  field :ENABLED, 1
  field :NOT_PRESENT, 2
end

defmodule Meshtastic.Config.NetworkConfig.AddressMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DHCP, 0
  field :STATIC, 1
end

defmodule Meshtastic.Config.NetworkConfig.ProtocolFlags do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NO_BROADCAST, 0
  field :UDP_BROADCAST, 1
end

defmodule Meshtastic.Config.DisplayConfig.DeprecatedGpsCoordinateFormat do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNUSED, 0
end

defmodule Meshtastic.Config.DisplayConfig.DisplayUnits do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :METRIC, 0
  field :IMPERIAL, 1
end

defmodule Meshtastic.Config.DisplayConfig.OledType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :OLED_AUTO, 0
  field :OLED_SSD1306, 1
  field :OLED_SH1106, 2
  field :OLED_SH1107, 3
  field :OLED_SH1107_128_128, 4
end

defmodule Meshtastic.Config.DisplayConfig.DisplayMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :TWOCOLOR, 1
  field :INVERTED, 2
  field :COLOR, 3
end

defmodule Meshtastic.Config.DisplayConfig.CompassOrientation do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEGREES_0, 0
  field :DEGREES_90, 1
  field :DEGREES_180, 2
  field :DEGREES_270, 3
  field :DEGREES_0_INVERTED, 4
  field :DEGREES_90_INVERTED, 5
  field :DEGREES_180_INVERTED, 6
  field :DEGREES_270_INVERTED, 7
end

defmodule Meshtastic.Config.LoRaConfig.RegionCode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :US, 1
  field :EU_433, 2
  field :EU_868, 3
  field :CN, 4
  field :JP, 5
  field :ANZ, 6
  field :KR, 7
  field :TW, 8
  field :RU, 9
  field :IN, 10
  field :NZ_865, 11
  field :TH, 12
  field :LORA_24, 13
  field :UA_433, 14
  field :UA_868, 15
  field :MY_433, 16
  field :MY_919, 17
  field :SG_923, 18
  field :PH_433, 19
  field :PH_868, 20
  field :PH_915, 21
  field :ANZ_433, 22
  field :KZ_433, 23
  field :KZ_863, 24
  field :NP_865, 25
  field :BR_902, 26
end

defmodule Meshtastic.Config.LoRaConfig.ModemPreset do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :LONG_FAST, 0
  field :LONG_SLOW, 1
  field :VERY_LONG_SLOW, 2
  field :MEDIUM_SLOW, 3
  field :MEDIUM_FAST, 4
  field :SHORT_SLOW, 5
  field :SHORT_FAST, 6
  field :LONG_MODERATE, 7
  field :SHORT_TURBO, 8
end

defmodule Meshtastic.Config.BluetoothConfig.PairingMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :RANDOM_PIN, 0
  field :FIXED_PIN, 1
  field :NO_PIN, 2
end

defmodule Meshtastic.Config.DeviceConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :role, 1, type: Meshtastic.Config.DeviceConfig.Role, enum: true
  field :serial_enabled, 2, type: :bool, json_name: "serialEnabled", deprecated: true
  field :button_gpio, 4, type: :uint32, json_name: "buttonGpio"
  field :buzzer_gpio, 5, type: :uint32, json_name: "buzzerGpio"

  field :rebroadcast_mode, 6,
    type: Meshtastic.Config.DeviceConfig.RebroadcastMode,
    json_name: "rebroadcastMode",
    enum: true

  field :node_info_broadcast_secs, 7, type: :uint32, json_name: "nodeInfoBroadcastSecs"
  field :double_tap_as_button_press, 8, type: :bool, json_name: "doubleTapAsButtonPress"
  field :is_managed, 9, type: :bool, json_name: "isManaged", deprecated: true
  field :disable_triple_click, 10, type: :bool, json_name: "disableTripleClick"
  field :tzdef, 11, type: :string
  field :led_heartbeat_disabled, 12, type: :bool, json_name: "ledHeartbeatDisabled"

  field :buzzer_mode, 13,
    type: Meshtastic.Config.DeviceConfig.BuzzerMode,
    json_name: "buzzerMode",
    enum: true
end

defmodule Meshtastic.Config.PositionConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :position_broadcast_secs, 1, type: :uint32, json_name: "positionBroadcastSecs"

  field :position_broadcast_smart_enabled, 2,
    type: :bool,
    json_name: "positionBroadcastSmartEnabled"

  field :fixed_position, 3, type: :bool, json_name: "fixedPosition"
  field :gps_enabled, 4, type: :bool, json_name: "gpsEnabled", deprecated: true
  field :gps_update_interval, 5, type: :uint32, json_name: "gpsUpdateInterval"
  field :gps_attempt_time, 6, type: :uint32, json_name: "gpsAttemptTime", deprecated: true
  field :position_flags, 7, type: :uint32, json_name: "positionFlags"
  field :rx_gpio, 8, type: :uint32, json_name: "rxGpio"
  field :tx_gpio, 9, type: :uint32, json_name: "txGpio"

  field :broadcast_smart_minimum_distance, 10,
    type: :uint32,
    json_name: "broadcastSmartMinimumDistance"

  field :broadcast_smart_minimum_interval_secs, 11,
    type: :uint32,
    json_name: "broadcastSmartMinimumIntervalSecs"

  field :gps_en_gpio, 12, type: :uint32, json_name: "gpsEnGpio"

  field :gps_mode, 13,
    type: Meshtastic.Config.PositionConfig.GpsMode,
    json_name: "gpsMode",
    enum: true
end

defmodule Meshtastic.Config.PowerConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :is_power_saving, 1, type: :bool, json_name: "isPowerSaving"
  field :on_battery_shutdown_after_secs, 2, type: :uint32, json_name: "onBatteryShutdownAfterSecs"
  field :adc_multiplier_override, 3, type: :float, json_name: "adcMultiplierOverride"
  field :wait_bluetooth_secs, 4, type: :uint32, json_name: "waitBluetoothSecs"
  field :sds_secs, 6, type: :uint32, json_name: "sdsSecs"
  field :ls_secs, 7, type: :uint32, json_name: "lsSecs"
  field :min_wake_secs, 8, type: :uint32, json_name: "minWakeSecs"
  field :device_battery_ina_address, 9, type: :uint32, json_name: "deviceBatteryInaAddress"
  field :powermon_enables, 32, type: :uint64, json_name: "powermonEnables"
end

defmodule Meshtastic.Config.NetworkConfig.IpV4Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ip, 1, type: :fixed32
  field :gateway, 2, type: :fixed32
  field :subnet, 3, type: :fixed32
  field :dns, 4, type: :fixed32
end

defmodule Meshtastic.Config.NetworkConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :wifi_enabled, 1, type: :bool, json_name: "wifiEnabled"
  field :wifi_ssid, 3, type: :string, json_name: "wifiSsid"
  field :wifi_psk, 4, type: :string, json_name: "wifiPsk"
  field :ntp_server, 5, type: :string, json_name: "ntpServer"
  field :eth_enabled, 6, type: :bool, json_name: "ethEnabled"

  field :address_mode, 7,
    type: Meshtastic.Config.NetworkConfig.AddressMode,
    json_name: "addressMode",
    enum: true

  field :ipv4_config, 8, type: Meshtastic.Config.NetworkConfig.IpV4Config, json_name: "ipv4Config"
  field :rsyslog_server, 9, type: :string, json_name: "rsyslogServer"
  field :enabled_protocols, 10, type: :uint32, json_name: "enabledProtocols"
  field :ipv6_enabled, 11, type: :bool, json_name: "ipv6Enabled"
end

defmodule Meshtastic.Config.DisplayConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :screen_on_secs, 1, type: :uint32, json_name: "screenOnSecs"

  field :gps_format, 2,
    type: Meshtastic.Config.DisplayConfig.DeprecatedGpsCoordinateFormat,
    json_name: "gpsFormat",
    enum: true,
    deprecated: true

  field :auto_screen_carousel_secs, 3, type: :uint32, json_name: "autoScreenCarouselSecs"
  field :compass_north_top, 4, type: :bool, json_name: "compassNorthTop", deprecated: true
  field :flip_screen, 5, type: :bool, json_name: "flipScreen"
  field :units, 6, type: Meshtastic.Config.DisplayConfig.DisplayUnits, enum: true
  field :oled, 7, type: Meshtastic.Config.DisplayConfig.OledType, enum: true
  field :displaymode, 8, type: Meshtastic.Config.DisplayConfig.DisplayMode, enum: true
  field :heading_bold, 9, type: :bool, json_name: "headingBold"
  field :wake_on_tap_or_motion, 10, type: :bool, json_name: "wakeOnTapOrMotion"

  field :compass_orientation, 11,
    type: Meshtastic.Config.DisplayConfig.CompassOrientation,
    json_name: "compassOrientation",
    enum: true

  field :use_12h_clock, 12, type: :bool, json_name: "use12hClock"
  field :use_long_node_name, 13, type: :bool, json_name: "useLongNodeName"
end

defmodule Meshtastic.Config.LoRaConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :use_preset, 1, type: :bool, json_name: "usePreset"

  field :modem_preset, 2,
    type: Meshtastic.Config.LoRaConfig.ModemPreset,
    json_name: "modemPreset",
    enum: true

  field :bandwidth, 3, type: :uint32
  field :spread_factor, 4, type: :uint32, json_name: "spreadFactor"
  field :coding_rate, 5, type: :uint32, json_name: "codingRate"
  field :frequency_offset, 6, type: :float, json_name: "frequencyOffset"
  field :region, 7, type: Meshtastic.Config.LoRaConfig.RegionCode, enum: true
  field :hop_limit, 8, type: :uint32, json_name: "hopLimit"
  field :tx_enabled, 9, type: :bool, json_name: "txEnabled"
  field :tx_power, 10, type: :int32, json_name: "txPower"
  field :channel_num, 11, type: :uint32, json_name: "channelNum"
  field :override_duty_cycle, 12, type: :bool, json_name: "overrideDutyCycle"
  field :sx126x_rx_boosted_gain, 13, type: :bool, json_name: "sx126xRxBoostedGain"
  field :override_frequency, 14, type: :float, json_name: "overrideFrequency"
  field :pa_fan_disabled, 15, type: :bool, json_name: "paFanDisabled"
  field :ignore_incoming, 103, repeated: true, type: :uint32, json_name: "ignoreIncoming"
  field :ignore_mqtt, 104, type: :bool, json_name: "ignoreMqtt"
  field :config_ok_to_mqtt, 105, type: :bool, json_name: "configOkToMqtt"
end

defmodule Meshtastic.Config.BluetoothConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :mode, 2, type: Meshtastic.Config.BluetoothConfig.PairingMode, enum: true
  field :fixed_pin, 3, type: :uint32, json_name: "fixedPin"
end

defmodule Meshtastic.Config.SecurityConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :public_key, 1, type: :bytes, json_name: "publicKey"
  field :private_key, 2, type: :bytes, json_name: "privateKey"
  field :admin_key, 3, repeated: true, type: :bytes, json_name: "adminKey"
  field :is_managed, 4, type: :bool, json_name: "isManaged"
  field :serial_enabled, 5, type: :bool, json_name: "serialEnabled"
  field :debug_log_api_enabled, 6, type: :bool, json_name: "debugLogApiEnabled"
  field :admin_channel_enabled, 8, type: :bool, json_name: "adminChannelEnabled"
end

defmodule Meshtastic.Config.SessionkeyConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Meshtastic.Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :device, 1, type: Meshtastic.Config.DeviceConfig, oneof: 0
  field :position, 2, type: Meshtastic.Config.PositionConfig, oneof: 0
  field :power, 3, type: Meshtastic.Config.PowerConfig, oneof: 0
  field :network, 4, type: Meshtastic.Config.NetworkConfig, oneof: 0
  field :display, 5, type: Meshtastic.Config.DisplayConfig, oneof: 0
  field :lora, 6, type: Meshtastic.Config.LoRaConfig, oneof: 0
  field :bluetooth, 7, type: Meshtastic.Config.BluetoothConfig, oneof: 0
  field :security, 8, type: Meshtastic.Config.SecurityConfig, oneof: 0
  field :sessionkey, 9, type: Meshtastic.Config.SessionkeyConfig, oneof: 0
  field :device_ui, 10, type: Meshtastic.DeviceUIConfig, json_name: "deviceUi", oneof: 0
end
