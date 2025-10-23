defmodule Meshtastic.AdminMessage.ConfigType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEVICE_CONFIG, 0
  field :POSITION_CONFIG, 1
  field :POWER_CONFIG, 2
  field :NETWORK_CONFIG, 3
  field :DISPLAY_CONFIG, 4
  field :LORA_CONFIG, 5
  field :BLUETOOTH_CONFIG, 6
  field :SECURITY_CONFIG, 7
  field :SESSIONKEY_CONFIG, 8
  field :DEVICEUI_CONFIG, 9
end

defmodule Meshtastic.AdminMessage.ModuleConfigType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :MQTT_CONFIG, 0
  field :SERIAL_CONFIG, 1
  field :EXTNOTIF_CONFIG, 2
  field :STOREFORWARD_CONFIG, 3
  field :RANGETEST_CONFIG, 4
  field :TELEMETRY_CONFIG, 5
  field :CANNEDMSG_CONFIG, 6
  field :AUDIO_CONFIG, 7
  field :REMOTEHARDWARE_CONFIG, 8
  field :NEIGHBORINFO_CONFIG, 9
  field :AMBIENTLIGHTING_CONFIG, 10
  field :DETECTIONSENSOR_CONFIG, 11
  field :PAXCOUNTER_CONFIG, 12
end

defmodule Meshtastic.AdminMessage.BackupLocation do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :FLASH, 0
  field :SD, 1
end

defmodule Meshtastic.KeyVerificationAdmin.MessageType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :INITIATE_VERIFICATION, 0
  field :PROVIDE_SECURITY_NUMBER, 1
  field :DO_VERIFY, 2
  field :DO_NOT_VERIFY, 3
end

defmodule Meshtastic.AdminMessage.InputEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :event_code, 1, type: :uint32, json_name: "eventCode"
  field :kb_char, 2, type: :uint32, json_name: "kbChar"
  field :touch_x, 3, type: :uint32, json_name: "touchX"
  field :touch_y, 4, type: :uint32, json_name: "touchY"
end

defmodule Meshtastic.AdminMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :session_passkey, 101, type: :bytes, json_name: "sessionPasskey"
  field :get_channel_request, 1, type: :uint32, json_name: "getChannelRequest", oneof: 0

  field :get_channel_response, 2,
    type: Meshtastic.Channel,
    json_name: "getChannelResponse",
    oneof: 0

  field :get_owner_request, 3, type: :bool, json_name: "getOwnerRequest", oneof: 0
  field :get_owner_response, 4, type: Meshtastic.User, json_name: "getOwnerResponse", oneof: 0

  field :get_config_request, 5,
    type: Meshtastic.AdminMessage.ConfigType,
    json_name: "getConfigRequest",
    enum: true,
    oneof: 0

  field :get_config_response, 6, type: Meshtastic.Config, json_name: "getConfigResponse", oneof: 0

  field :get_module_config_request, 7,
    type: Meshtastic.AdminMessage.ModuleConfigType,
    json_name: "getModuleConfigRequest",
    enum: true,
    oneof: 0

  field :get_module_config_response, 8,
    type: Meshtastic.ModuleConfig,
    json_name: "getModuleConfigResponse",
    oneof: 0

  field :get_canned_message_module_messages_request, 10,
    type: :bool,
    json_name: "getCannedMessageModuleMessagesRequest",
    oneof: 0

  field :get_canned_message_module_messages_response, 11,
    type: :string,
    json_name: "getCannedMessageModuleMessagesResponse",
    oneof: 0

  field :get_device_metadata_request, 12,
    type: :bool,
    json_name: "getDeviceMetadataRequest",
    oneof: 0

  field :get_device_metadata_response, 13,
    type: Meshtastic.DeviceMetadata,
    json_name: "getDeviceMetadataResponse",
    oneof: 0

  field :get_ringtone_request, 14, type: :bool, json_name: "getRingtoneRequest", oneof: 0
  field :get_ringtone_response, 15, type: :string, json_name: "getRingtoneResponse", oneof: 0

  field :get_device_connection_status_request, 16,
    type: :bool,
    json_name: "getDeviceConnectionStatusRequest",
    oneof: 0

  field :get_device_connection_status_response, 17,
    type: Meshtastic.DeviceConnectionStatus,
    json_name: "getDeviceConnectionStatusResponse",
    oneof: 0

  field :set_ham_mode, 18, type: Meshtastic.HamParameters, json_name: "setHamMode", oneof: 0

  field :get_node_remote_hardware_pins_request, 19,
    type: :bool,
    json_name: "getNodeRemoteHardwarePinsRequest",
    oneof: 0

  field :get_node_remote_hardware_pins_response, 20,
    type: Meshtastic.NodeRemoteHardwarePinsResponse,
    json_name: "getNodeRemoteHardwarePinsResponse",
    oneof: 0

  field :enter_dfu_mode_request, 21, type: :bool, json_name: "enterDfuModeRequest", oneof: 0
  field :delete_file_request, 22, type: :string, json_name: "deleteFileRequest", oneof: 0
  field :set_scale, 23, type: :uint32, json_name: "setScale", oneof: 0

  field :backup_preferences, 24,
    type: Meshtastic.AdminMessage.BackupLocation,
    json_name: "backupPreferences",
    enum: true,
    oneof: 0

  field :restore_preferences, 25,
    type: Meshtastic.AdminMessage.BackupLocation,
    json_name: "restorePreferences",
    enum: true,
    oneof: 0

  field :remove_backup_preferences, 26,
    type: Meshtastic.AdminMessage.BackupLocation,
    json_name: "removeBackupPreferences",
    enum: true,
    oneof: 0

  field :send_input_event, 27,
    type: Meshtastic.AdminMessage.InputEvent,
    json_name: "sendInputEvent",
    oneof: 0

  field :set_owner, 32, type: Meshtastic.User, json_name: "setOwner", oneof: 0
  field :set_channel, 33, type: Meshtastic.Channel, json_name: "setChannel", oneof: 0
  field :set_config, 34, type: Meshtastic.Config, json_name: "setConfig", oneof: 0

  field :set_module_config, 35,
    type: Meshtastic.ModuleConfig,
    json_name: "setModuleConfig",
    oneof: 0

  field :set_canned_message_module_messages, 36,
    type: :string,
    json_name: "setCannedMessageModuleMessages",
    oneof: 0

  field :set_ringtone_message, 37, type: :string, json_name: "setRingtoneMessage", oneof: 0
  field :remove_by_nodenum, 38, type: :uint32, json_name: "removeByNodenum", oneof: 0
  field :set_favorite_node, 39, type: :uint32, json_name: "setFavoriteNode", oneof: 0
  field :remove_favorite_node, 40, type: :uint32, json_name: "removeFavoriteNode", oneof: 0

  field :set_fixed_position, 41,
    type: Meshtastic.Position,
    json_name: "setFixedPosition",
    oneof: 0

  field :remove_fixed_position, 42, type: :bool, json_name: "removeFixedPosition", oneof: 0
  field :set_time_only, 43, type: :fixed32, json_name: "setTimeOnly", oneof: 0
  field :get_ui_config_request, 44, type: :bool, json_name: "getUiConfigRequest", oneof: 0

  field :get_ui_config_response, 45,
    type: Meshtastic.DeviceUIConfig,
    json_name: "getUiConfigResponse",
    oneof: 0

  field :store_ui_config, 46,
    type: Meshtastic.DeviceUIConfig,
    json_name: "storeUiConfig",
    oneof: 0

  field :set_ignored_node, 47, type: :uint32, json_name: "setIgnoredNode", oneof: 0
  field :remove_ignored_node, 48, type: :uint32, json_name: "removeIgnoredNode", oneof: 0
  field :begin_edit_settings, 64, type: :bool, json_name: "beginEditSettings", oneof: 0
  field :commit_edit_settings, 65, type: :bool, json_name: "commitEditSettings", oneof: 0
  field :add_contact, 66, type: Meshtastic.SharedContact, json_name: "addContact", oneof: 0

  field :key_verification, 67,
    type: Meshtastic.KeyVerificationAdmin,
    json_name: "keyVerification",
    oneof: 0

  field :factory_reset_device, 94, type: :int32, json_name: "factoryResetDevice", oneof: 0
  field :reboot_ota_seconds, 95, type: :int32, json_name: "rebootOtaSeconds", oneof: 0
  field :exit_simulator, 96, type: :bool, json_name: "exitSimulator", oneof: 0
  field :reboot_seconds, 97, type: :int32, json_name: "rebootSeconds", oneof: 0
  field :shutdown_seconds, 98, type: :int32, json_name: "shutdownSeconds", oneof: 0
  field :factory_reset_config, 99, type: :int32, json_name: "factoryResetConfig", oneof: 0
  field :nodedb_reset, 100, type: :int32, json_name: "nodedbReset", oneof: 0
end

defmodule Meshtastic.HamParameters do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :call_sign, 1, type: :string, json_name: "callSign"
  field :tx_power, 2, type: :int32, json_name: "txPower"
  field :frequency, 3, type: :float
  field :short_name, 4, type: :string, json_name: "shortName"
end

defmodule Meshtastic.NodeRemoteHardwarePinsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_remote_hardware_pins, 1,
    repeated: true,
    type: Meshtastic.NodeRemoteHardwarePin,
    json_name: "nodeRemoteHardwarePins"
end

defmodule Meshtastic.SharedContact do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_num, 1, type: :uint32, json_name: "nodeNum"
  field :user, 2, type: Meshtastic.User
  field :should_ignore, 3, type: :bool, json_name: "shouldIgnore"
  field :manually_verified, 4, type: :bool, json_name: "manuallyVerified"
end

defmodule Meshtastic.KeyVerificationAdmin do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :message_type, 1,
    type: Meshtastic.KeyVerificationAdmin.MessageType,
    json_name: "messageType",
    enum: true

  field :remote_nodenum, 2, type: :uint32, json_name: "remoteNodenum"
  field :nonce, 3, type: :uint64
  field :security_number, 4, proto3_optional: true, type: :uint32, json_name: "securityNumber"
end
