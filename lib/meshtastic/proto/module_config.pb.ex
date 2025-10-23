defmodule Meshtastic.RemoteHardwarePinType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :DIGITAL_READ, 1
  field :DIGITAL_WRITE, 2
end

defmodule Meshtastic.ModuleConfig.DetectionSensorConfig.TriggerType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :LOGIC_LOW, 0
  field :LOGIC_HIGH, 1
  field :FALLING_EDGE, 2
  field :RISING_EDGE, 3
  field :EITHER_EDGE_ACTIVE_LOW, 4
  field :EITHER_EDGE_ACTIVE_HIGH, 5
end

defmodule Meshtastic.ModuleConfig.AudioConfig.Audio_Baud do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :CODEC2_DEFAULT, 0
  field :CODEC2_3200, 1
  field :CODEC2_2400, 2
  field :CODEC2_1600, 3
  field :CODEC2_1400, 4
  field :CODEC2_1300, 5
  field :CODEC2_1200, 6
  field :CODEC2_700, 7
  field :CODEC2_700B, 8
end

defmodule Meshtastic.ModuleConfig.SerialConfig.Serial_Baud do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :BAUD_DEFAULT, 0
  field :BAUD_110, 1
  field :BAUD_300, 2
  field :BAUD_600, 3
  field :BAUD_1200, 4
  field :BAUD_2400, 5
  field :BAUD_4800, 6
  field :BAUD_9600, 7
  field :BAUD_19200, 8
  field :BAUD_38400, 9
  field :BAUD_57600, 10
  field :BAUD_115200, 11
  field :BAUD_230400, 12
  field :BAUD_460800, 13
  field :BAUD_576000, 14
  field :BAUD_921600, 15
end

defmodule Meshtastic.ModuleConfig.SerialConfig.Serial_Mode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :SIMPLE, 1
  field :PROTO, 2
  field :TEXTMSG, 3
  field :NMEA, 4
  field :CALTOPO, 5
  field :WS85, 6
  field :VE_DIRECT, 7
  field :MS_CONFIG, 8
end

defmodule Meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :UP, 17
  field :DOWN, 18
  field :LEFT, 19
  field :RIGHT, 20
  field :SELECT, 10
  field :BACK, 27
  field :CANCEL, 24
end

defmodule Meshtastic.ModuleConfig.MQTTConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :address, 2, type: :string
  field :username, 3, type: :string
  field :password, 4, type: :string
  field :encryption_enabled, 5, type: :bool, json_name: "encryptionEnabled"
  field :json_enabled, 6, type: :bool, json_name: "jsonEnabled"
  field :tls_enabled, 7, type: :bool, json_name: "tlsEnabled"
  field :root, 8, type: :string
  field :proxy_to_client_enabled, 9, type: :bool, json_name: "proxyToClientEnabled"
  field :map_reporting_enabled, 10, type: :bool, json_name: "mapReportingEnabled"

  field :map_report_settings, 11,
    type: Meshtastic.ModuleConfig.MapReportSettings,
    json_name: "mapReportSettings"
end

defmodule Meshtastic.ModuleConfig.MapReportSettings do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :publish_interval_secs, 1, type: :uint32, json_name: "publishIntervalSecs"
  field :position_precision, 2, type: :uint32, json_name: "positionPrecision"
  field :should_report_location, 3, type: :bool, json_name: "shouldReportLocation"
end

defmodule Meshtastic.ModuleConfig.RemoteHardwareConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :allow_undefined_pin_access, 2, type: :bool, json_name: "allowUndefinedPinAccess"

  field :available_pins, 3,
    repeated: true,
    type: Meshtastic.RemoteHardwarePin,
    json_name: "availablePins"
end

defmodule Meshtastic.ModuleConfig.NeighborInfoConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :update_interval, 2, type: :uint32, json_name: "updateInterval"
  field :transmit_over_lora, 3, type: :bool, json_name: "transmitOverLora"
end

defmodule Meshtastic.ModuleConfig.DetectionSensorConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :minimum_broadcast_secs, 2, type: :uint32, json_name: "minimumBroadcastSecs"
  field :state_broadcast_secs, 3, type: :uint32, json_name: "stateBroadcastSecs"
  field :send_bell, 4, type: :bool, json_name: "sendBell"
  field :name, 5, type: :string
  field :monitor_pin, 6, type: :uint32, json_name: "monitorPin"

  field :detection_trigger_type, 7,
    type: Meshtastic.ModuleConfig.DetectionSensorConfig.TriggerType,
    json_name: "detectionTriggerType",
    enum: true

  field :use_pullup, 8, type: :bool, json_name: "usePullup"
end

defmodule Meshtastic.ModuleConfig.AudioConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :codec2_enabled, 1, type: :bool, json_name: "codec2Enabled"
  field :ptt_pin, 2, type: :uint32, json_name: "pttPin"
  field :bitrate, 3, type: Meshtastic.ModuleConfig.AudioConfig.Audio_Baud, enum: true
  field :i2s_ws, 4, type: :uint32, json_name: "i2sWs"
  field :i2s_sd, 5, type: :uint32, json_name: "i2sSd"
  field :i2s_din, 6, type: :uint32, json_name: "i2sDin"
  field :i2s_sck, 7, type: :uint32, json_name: "i2sSck"
end

defmodule Meshtastic.ModuleConfig.PaxcounterConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :paxcounter_update_interval, 2, type: :uint32, json_name: "paxcounterUpdateInterval"
  field :wifi_threshold, 3, type: :int32, json_name: "wifiThreshold"
  field :ble_threshold, 4, type: :int32, json_name: "bleThreshold"
end

defmodule Meshtastic.ModuleConfig.SerialConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :echo, 2, type: :bool
  field :rxd, 3, type: :uint32
  field :txd, 4, type: :uint32
  field :baud, 5, type: Meshtastic.ModuleConfig.SerialConfig.Serial_Baud, enum: true
  field :timeout, 6, type: :uint32
  field :mode, 7, type: Meshtastic.ModuleConfig.SerialConfig.Serial_Mode, enum: true
  field :override_console_serial_port, 8, type: :bool, json_name: "overrideConsoleSerialPort"
end

defmodule Meshtastic.ModuleConfig.ExternalNotificationConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :output_ms, 2, type: :uint32, json_name: "outputMs"
  field :output, 3, type: :uint32
  field :output_vibra, 8, type: :uint32, json_name: "outputVibra"
  field :output_buzzer, 9, type: :uint32, json_name: "outputBuzzer"
  field :active, 4, type: :bool
  field :alert_message, 5, type: :bool, json_name: "alertMessage"
  field :alert_message_vibra, 10, type: :bool, json_name: "alertMessageVibra"
  field :alert_message_buzzer, 11, type: :bool, json_name: "alertMessageBuzzer"
  field :alert_bell, 6, type: :bool, json_name: "alertBell"
  field :alert_bell_vibra, 12, type: :bool, json_name: "alertBellVibra"
  field :alert_bell_buzzer, 13, type: :bool, json_name: "alertBellBuzzer"
  field :use_pwm, 7, type: :bool, json_name: "usePwm"
  field :nag_timeout, 14, type: :uint32, json_name: "nagTimeout"
  field :use_i2s_as_buzzer, 15, type: :bool, json_name: "useI2sAsBuzzer"
end

defmodule Meshtastic.ModuleConfig.StoreForwardConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :heartbeat, 2, type: :bool
  field :records, 3, type: :uint32
  field :history_return_max, 4, type: :uint32, json_name: "historyReturnMax"
  field :history_return_window, 5, type: :uint32, json_name: "historyReturnWindow"
  field :is_server, 6, type: :bool, json_name: "isServer"
end

defmodule Meshtastic.ModuleConfig.RangeTestConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enabled, 1, type: :bool
  field :sender, 2, type: :uint32
  field :save, 3, type: :bool
  field :clear_on_reboot, 4, type: :bool, json_name: "clearOnReboot"
end

defmodule Meshtastic.ModuleConfig.TelemetryConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :device_update_interval, 1, type: :uint32, json_name: "deviceUpdateInterval"
  field :environment_update_interval, 2, type: :uint32, json_name: "environmentUpdateInterval"

  field :environment_measurement_enabled, 3,
    type: :bool,
    json_name: "environmentMeasurementEnabled"

  field :environment_screen_enabled, 4, type: :bool, json_name: "environmentScreenEnabled"
  field :environment_display_fahrenheit, 5, type: :bool, json_name: "environmentDisplayFahrenheit"
  field :air_quality_enabled, 6, type: :bool, json_name: "airQualityEnabled"
  field :air_quality_interval, 7, type: :uint32, json_name: "airQualityInterval"
  field :power_measurement_enabled, 8, type: :bool, json_name: "powerMeasurementEnabled"
  field :power_update_interval, 9, type: :uint32, json_name: "powerUpdateInterval"
  field :power_screen_enabled, 10, type: :bool, json_name: "powerScreenEnabled"
  field :health_measurement_enabled, 11, type: :bool, json_name: "healthMeasurementEnabled"
  field :health_update_interval, 12, type: :uint32, json_name: "healthUpdateInterval"
  field :health_screen_enabled, 13, type: :bool, json_name: "healthScreenEnabled"
  field :device_telemetry_enabled, 14, type: :bool, json_name: "deviceTelemetryEnabled"
end

defmodule Meshtastic.ModuleConfig.CannedMessageConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rotary1_enabled, 1, type: :bool, json_name: "rotary1Enabled"
  field :inputbroker_pin_a, 2, type: :uint32, json_name: "inputbrokerPinA"
  field :inputbroker_pin_b, 3, type: :uint32, json_name: "inputbrokerPinB"
  field :inputbroker_pin_press, 4, type: :uint32, json_name: "inputbrokerPinPress"

  field :inputbroker_event_cw, 5,
    type: Meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar,
    json_name: "inputbrokerEventCw",
    enum: true

  field :inputbroker_event_ccw, 6,
    type: Meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar,
    json_name: "inputbrokerEventCcw",
    enum: true

  field :inputbroker_event_press, 7,
    type: Meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar,
    json_name: "inputbrokerEventPress",
    enum: true

  field :updown1_enabled, 8, type: :bool, json_name: "updown1Enabled"
  field :enabled, 9, type: :bool, deprecated: true
  field :allow_input_source, 10, type: :string, json_name: "allowInputSource", deprecated: true
  field :send_bell, 11, type: :bool, json_name: "sendBell"
end

defmodule Meshtastic.ModuleConfig.AmbientLightingConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :led_state, 1, type: :bool, json_name: "ledState"
  field :current, 2, type: :uint32
  field :red, 3, type: :uint32
  field :green, 4, type: :uint32
  field :blue, 5, type: :uint32
end

defmodule Meshtastic.ModuleConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :mqtt, 1, type: Meshtastic.ModuleConfig.MQTTConfig, oneof: 0
  field :serial, 2, type: Meshtastic.ModuleConfig.SerialConfig, oneof: 0

  field :external_notification, 3,
    type: Meshtastic.ModuleConfig.ExternalNotificationConfig,
    json_name: "externalNotification",
    oneof: 0

  field :store_forward, 4,
    type: Meshtastic.ModuleConfig.StoreForwardConfig,
    json_name: "storeForward",
    oneof: 0

  field :range_test, 5,
    type: Meshtastic.ModuleConfig.RangeTestConfig,
    json_name: "rangeTest",
    oneof: 0

  field :telemetry, 6, type: Meshtastic.ModuleConfig.TelemetryConfig, oneof: 0

  field :canned_message, 7,
    type: Meshtastic.ModuleConfig.CannedMessageConfig,
    json_name: "cannedMessage",
    oneof: 0

  field :audio, 8, type: Meshtastic.ModuleConfig.AudioConfig, oneof: 0

  field :remote_hardware, 9,
    type: Meshtastic.ModuleConfig.RemoteHardwareConfig,
    json_name: "remoteHardware",
    oneof: 0

  field :neighbor_info, 10,
    type: Meshtastic.ModuleConfig.NeighborInfoConfig,
    json_name: "neighborInfo",
    oneof: 0

  field :ambient_lighting, 11,
    type: Meshtastic.ModuleConfig.AmbientLightingConfig,
    json_name: "ambientLighting",
    oneof: 0

  field :detection_sensor, 12,
    type: Meshtastic.ModuleConfig.DetectionSensorConfig,
    json_name: "detectionSensor",
    oneof: 0

  field :paxcounter, 13, type: Meshtastic.ModuleConfig.PaxcounterConfig, oneof: 0
end

defmodule Meshtastic.RemoteHardwarePin do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :gpio_pin, 1, type: :uint32, json_name: "gpioPin"
  field :name, 2, type: :string
  field :type, 3, type: Meshtastic.RemoteHardwarePinType, enum: true
end
