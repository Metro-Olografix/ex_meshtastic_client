defmodule Meshtastic.LocalConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :device, 1, type: Meshtastic.Config.DeviceConfig
  field :position, 2, type: Meshtastic.Config.PositionConfig
  field :power, 3, type: Meshtastic.Config.PowerConfig
  field :network, 4, type: Meshtastic.Config.NetworkConfig
  field :display, 5, type: Meshtastic.Config.DisplayConfig
  field :lora, 6, type: Meshtastic.Config.LoRaConfig
  field :bluetooth, 7, type: Meshtastic.Config.BluetoothConfig
  field :version, 8, type: :uint32
  field :security, 9, type: Meshtastic.Config.SecurityConfig
end

defmodule Meshtastic.LocalModuleConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :mqtt, 1, type: Meshtastic.ModuleConfig.MQTTConfig
  field :serial, 2, type: Meshtastic.ModuleConfig.SerialConfig

  field :external_notification, 3,
    type: Meshtastic.ModuleConfig.ExternalNotificationConfig,
    json_name: "externalNotification"

  field :store_forward, 4,
    type: Meshtastic.ModuleConfig.StoreForwardConfig,
    json_name: "storeForward"

  field :range_test, 5, type: Meshtastic.ModuleConfig.RangeTestConfig, json_name: "rangeTest"
  field :telemetry, 6, type: Meshtastic.ModuleConfig.TelemetryConfig

  field :canned_message, 7,
    type: Meshtastic.ModuleConfig.CannedMessageConfig,
    json_name: "cannedMessage"

  field :audio, 9, type: Meshtastic.ModuleConfig.AudioConfig

  field :remote_hardware, 10,
    type: Meshtastic.ModuleConfig.RemoteHardwareConfig,
    json_name: "remoteHardware"

  field :neighbor_info, 11,
    type: Meshtastic.ModuleConfig.NeighborInfoConfig,
    json_name: "neighborInfo"

  field :ambient_lighting, 12,
    type: Meshtastic.ModuleConfig.AmbientLightingConfig,
    json_name: "ambientLighting"

  field :detection_sensor, 13,
    type: Meshtastic.ModuleConfig.DetectionSensorConfig,
    json_name: "detectionSensor"

  field :paxcounter, 14, type: Meshtastic.ModuleConfig.PaxcounterConfig
  field :version, 8, type: :uint32
end
