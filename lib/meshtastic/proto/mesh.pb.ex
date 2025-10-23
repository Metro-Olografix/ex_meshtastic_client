defmodule Meshtastic.HardwareModel do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :TLORA_V2, 1
  field :TLORA_V1, 2
  field :TLORA_V2_1_1P6, 3
  field :TBEAM, 4
  field :HELTEC_V2_0, 5
  field :TBEAM_V0P7, 6
  field :T_ECHO, 7
  field :TLORA_V1_1P3, 8
  field :RAK4631, 9
  field :HELTEC_V2_1, 10
  field :HELTEC_V1, 11
  field :LILYGO_TBEAM_S3_CORE, 12
  field :RAK11200, 13
  field :NANO_G1, 14
  field :TLORA_V2_1_1P8, 15
  field :TLORA_T3_S3, 16
  field :NANO_G1_EXPLORER, 17
  field :NANO_G2_ULTRA, 18
  field :LORA_TYPE, 19
  field :WIPHONE, 20
  field :WIO_WM1110, 21
  field :RAK2560, 22
  field :HELTEC_HRU_3601, 23
  field :HELTEC_WIRELESS_BRIDGE, 24
  field :STATION_G1, 25
  field :RAK11310, 26
  field :SENSELORA_RP2040, 27
  field :SENSELORA_S3, 28
  field :CANARYONE, 29
  field :RP2040_LORA, 30
  field :STATION_G2, 31
  field :LORA_RELAY_V1, 32
  field :NRF52840DK, 33
  field :PPR, 34
  field :GENIEBLOCKS, 35
  field :NRF52_UNKNOWN, 36
  field :PORTDUINO, 37
  field :ANDROID_SIM, 38
  field :DIY_V1, 39
  field :NRF52840_PCA10059, 40
  field :DR_DEV, 41
  field :M5STACK, 42
  field :HELTEC_V3, 43
  field :HELTEC_WSL_V3, 44
  field :BETAFPV_2400_TX, 45
  field :BETAFPV_900_NANO_TX, 46
  field :RPI_PICO, 47
  field :HELTEC_WIRELESS_TRACKER, 48
  field :HELTEC_WIRELESS_PAPER, 49
  field :T_DECK, 50
  field :T_WATCH_S3, 51
  field :PICOMPUTER_S3, 52
  field :HELTEC_HT62, 53
  field :EBYTE_ESP32_S3, 54
  field :ESP32_S3_PICO, 55
  field :CHATTER_2, 56
  field :HELTEC_WIRELESS_PAPER_V1_0, 57
  field :HELTEC_WIRELESS_TRACKER_V1_0, 58
  field :UNPHONE, 59
  field :TD_LORAC, 60
  field :CDEBYTE_EORA_S3, 61
  field :TWC_MESH_V4, 62
  field :NRF52_PROMICRO_DIY, 63
  field :RADIOMASTER_900_BANDIT_NANO, 64
  field :HELTEC_CAPSULE_SENSOR_V3, 65
  field :HELTEC_VISION_MASTER_T190, 66
  field :HELTEC_VISION_MASTER_E213, 67
  field :HELTEC_VISION_MASTER_E290, 68
  field :HELTEC_MESH_NODE_T114, 69
  field :SENSECAP_INDICATOR, 70
  field :TRACKER_T1000_E, 71
  field :RAK3172, 72
  field :WIO_E5, 73
  field :RADIOMASTER_900_BANDIT, 74
  field :ME25LS01_4Y10TD, 75
  field :RP2040_FEATHER_RFM95, 76
  field :M5STACK_COREBASIC, 77
  field :M5STACK_CORE2, 78
  field :RPI_PICO2, 79
  field :M5STACK_CORES3, 80
  field :SEEED_XIAO_S3, 81
  field :MS24SF1, 82
  field :TLORA_C6, 83
  field :WISMESH_TAP, 84
  field :ROUTASTIC, 85
  field :MESH_TAB, 86
  field :MESHLINK, 87
  field :XIAO_NRF52_KIT, 88
  field :THINKNODE_M1, 89
  field :THINKNODE_M2, 90
  field :T_ETH_ELITE, 91
  field :HELTEC_SENSOR_HUB, 92
  field :RESERVED_FRIED_CHICKEN, 93
  field :HELTEC_MESH_POCKET, 94
  field :SEEED_SOLAR_NODE, 95
  field :NOMADSTAR_METEOR_PRO, 96
  field :CROWPANEL, 97
  field :LINK_32, 98
  field :SEEED_WIO_TRACKER_L1, 99
  field :SEEED_WIO_TRACKER_L1_EINK, 100
  field :MUZI_R1_NEO, 101
  field :T_DECK_PRO, 102
  field :T_LORA_PAGER, 103
  field :M5STACK_RESERVED, 104
  field :WISMESH_TAG, 105
  field :RAK3312, 106
  field :THINKNODE_M5, 107
  field :HELTEC_MESH_SOLAR, 108
  field :T_ECHO_LITE, 109
  field :HELTEC_V4, 110
  field :M5STACK_C6L, 111
  field :M5STACK_CARDPUTER_ADV, 112
  field :HELTEC_WIRELESS_TRACKER_V2, 113
  field :T_WATCH_ULTRA, 114
  field :THINKNODE_M3, 115
  field :PRIVATE_HW, 255
end

defmodule Meshtastic.Constants do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ZERO, 0
  field :DATA_PAYLOAD_LEN, 233
end

defmodule Meshtastic.CriticalErrorCode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :TX_WATCHDOG, 1
  field :SLEEP_ENTER_WAIT, 2
  field :NO_RADIO, 3
  field :UNSPECIFIED, 4
  field :UBLOX_UNIT_FAILED, 5
  field :NO_AXP192, 6
  field :INVALID_RADIO_SETTING, 7
  field :TRANSMIT_FAILED, 8
  field :BROWNOUT, 9
  field :SX1262_FAILURE, 10
  field :RADIO_SPI_BUG, 11
  field :FLASH_CORRUPTION_RECOVERABLE, 12
  field :FLASH_CORRUPTION_UNRECOVERABLE, 13
end

defmodule Meshtastic.FirmwareEdition do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :VANILLA, 0
  field :SMART_CITIZEN, 1
  field :OPEN_SAUCE, 16
  field :DEFCON, 17
  field :BURNING_MAN, 18
  field :HAMVENTION, 19
  field :DIY_EDITION, 127
end

defmodule Meshtastic.ExcludedModules do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :EXCLUDED_NONE, 0
  field :MQTT_CONFIG, 1
  field :SERIAL_CONFIG, 2
  field :EXTNOTIF_CONFIG, 4
  field :STOREFORWARD_CONFIG, 8
  field :RANGETEST_CONFIG, 16
  field :TELEMETRY_CONFIG, 32
  field :CANNEDMSG_CONFIG, 64
  field :AUDIO_CONFIG, 128
  field :REMOTEHARDWARE_CONFIG, 256
  field :NEIGHBORINFO_CONFIG, 512
  field :AMBIENTLIGHTING_CONFIG, 1024
  field :DETECTIONSENSOR_CONFIG, 2048
  field :PAXCOUNTER_CONFIG, 4096
  field :BLUETOOTH_CONFIG, 8192
  field :NETWORK_CONFIG, 16384
end

defmodule Meshtastic.Position.LocSource do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :LOC_UNSET, 0
  field :LOC_MANUAL, 1
  field :LOC_INTERNAL, 2
  field :LOC_EXTERNAL, 3
end

defmodule Meshtastic.Position.AltSource do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALT_UNSET, 0
  field :ALT_MANUAL, 1
  field :ALT_INTERNAL, 2
  field :ALT_EXTERNAL, 3
  field :ALT_BAROMETRIC, 4
end

defmodule Meshtastic.Routing.Error do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :NO_ROUTE, 1
  field :GOT_NAK, 2
  field :TIMEOUT, 3
  field :NO_INTERFACE, 4
  field :MAX_RETRANSMIT, 5
  field :NO_CHANNEL, 6
  field :TOO_LARGE, 7
  field :NO_RESPONSE, 8
  field :DUTY_CYCLE_LIMIT, 9
  field :BAD_REQUEST, 32
  field :NOT_AUTHORIZED, 33
  field :PKI_FAILED, 34
  field :PKI_UNKNOWN_PUBKEY, 35
  field :ADMIN_BAD_SESSION_KEY, 36
  field :ADMIN_PUBLIC_KEY_UNAUTHORIZED, 37
  field :RATE_LIMIT_EXCEEDED, 38
end

defmodule Meshtastic.MeshPacket.Priority do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :MIN, 1
  field :BACKGROUND, 10
  field :DEFAULT, 64
  field :RELIABLE, 70
  field :RESPONSE, 80
  field :HIGH, 100
  field :ALERT, 110
  field :ACK, 120
  field :MAX, 127
end

defmodule Meshtastic.MeshPacket.Delayed do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NO_DELAY, 0
  field :DELAYED_BROADCAST, 1
  field :DELAYED_DIRECT, 2
end

defmodule Meshtastic.MeshPacket.TransportMechanism do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :TRANSPORT_INTERNAL, 0
  field :TRANSPORT_LORA, 1
  field :TRANSPORT_LORA_ALT1, 2
  field :TRANSPORT_LORA_ALT2, 3
  field :TRANSPORT_LORA_ALT3, 4
  field :TRANSPORT_MQTT, 5
  field :TRANSPORT_MULTICAST_UDP, 6
  field :TRANSPORT_API, 7
end

defmodule Meshtastic.LogRecord.Level do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :CRITICAL, 50
  field :ERROR, 40
  field :WARNING, 30
  field :INFO, 20
  field :DEBUG, 10
  field :TRACE, 5
end

defmodule Meshtastic.Position do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :latitude_i, 1, proto3_optional: true, type: :sfixed32, json_name: "latitudeI"
  field :longitude_i, 2, proto3_optional: true, type: :sfixed32, json_name: "longitudeI"
  field :altitude, 3, proto3_optional: true, type: :int32
  field :time, 4, type: :fixed32

  field :location_source, 5,
    type: Meshtastic.Position.LocSource,
    json_name: "locationSource",
    enum: true

  field :altitude_source, 6,
    type: Meshtastic.Position.AltSource,
    json_name: "altitudeSource",
    enum: true

  field :timestamp, 7, type: :fixed32
  field :timestamp_millis_adjust, 8, type: :int32, json_name: "timestampMillisAdjust"
  field :altitude_hae, 9, proto3_optional: true, type: :sint32, json_name: "altitudeHae"

  field :altitude_geoidal_separation, 10,
    proto3_optional: true,
    type: :sint32,
    json_name: "altitudeGeoidalSeparation"

  field :PDOP, 11, type: :uint32
  field :HDOP, 12, type: :uint32
  field :VDOP, 13, type: :uint32
  field :gps_accuracy, 14, type: :uint32, json_name: "gpsAccuracy"
  field :ground_speed, 15, proto3_optional: true, type: :uint32, json_name: "groundSpeed"
  field :ground_track, 16, proto3_optional: true, type: :uint32, json_name: "groundTrack"
  field :fix_quality, 17, type: :uint32, json_name: "fixQuality"
  field :fix_type, 18, type: :uint32, json_name: "fixType"
  field :sats_in_view, 19, type: :uint32, json_name: "satsInView"
  field :sensor_id, 20, type: :uint32, json_name: "sensorId"
  field :next_update, 21, type: :uint32, json_name: "nextUpdate"
  field :seq_number, 22, type: :uint32, json_name: "seqNumber"
  field :precision_bits, 23, type: :uint32, json_name: "precisionBits"
end

defmodule Meshtastic.User do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :id, 1, type: :string
  field :long_name, 2, type: :string, json_name: "longName"
  field :short_name, 3, type: :string, json_name: "shortName"
  field :macaddr, 4, type: :bytes, deprecated: true
  field :hw_model, 5, type: Meshtastic.HardwareModel, json_name: "hwModel", enum: true
  field :is_licensed, 6, type: :bool, json_name: "isLicensed"
  field :role, 7, type: Meshtastic.Config.DeviceConfig.Role, enum: true
  field :public_key, 8, type: :bytes, json_name: "publicKey"
  field :is_unmessagable, 9, proto3_optional: true, type: :bool, json_name: "isUnmessagable"
end

defmodule Meshtastic.RouteDiscovery do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :route, 1, repeated: true, type: :fixed32
  field :snr_towards, 2, repeated: true, type: :int32, json_name: "snrTowards"
  field :route_back, 3, repeated: true, type: :fixed32, json_name: "routeBack"
  field :snr_back, 4, repeated: true, type: :int32, json_name: "snrBack"
end

defmodule Meshtastic.Routing do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :variant, 0

  field :route_request, 1, type: Meshtastic.RouteDiscovery, json_name: "routeRequest", oneof: 0
  field :route_reply, 2, type: Meshtastic.RouteDiscovery, json_name: "routeReply", oneof: 0

  field :error_reason, 3,
    type: Meshtastic.Routing.Error,
    json_name: "errorReason",
    enum: true,
    oneof: 0
end

defmodule Meshtastic.Data do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :portnum, 1, type: Meshtastic.PortNum, enum: true
  field :payload, 2, type: :bytes
  field :want_response, 3, type: :bool, json_name: "wantResponse"
  field :dest, 4, type: :fixed32
  field :source, 5, type: :fixed32
  field :request_id, 6, type: :fixed32, json_name: "requestId"
  field :reply_id, 7, type: :fixed32, json_name: "replyId"
  field :emoji, 8, type: :fixed32
  field :bitfield, 9, proto3_optional: true, type: :uint32
end

defmodule Meshtastic.KeyVerification do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :nonce, 1, type: :uint64
  field :hash1, 2, type: :bytes
  field :hash2, 3, type: :bytes
end

defmodule Meshtastic.Waypoint do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :id, 1, type: :uint32
  field :latitude_i, 2, proto3_optional: true, type: :sfixed32, json_name: "latitudeI"
  field :longitude_i, 3, proto3_optional: true, type: :sfixed32, json_name: "longitudeI"
  field :expire, 4, type: :uint32
  field :locked_to, 5, type: :uint32, json_name: "lockedTo"
  field :name, 6, type: :string
  field :description, 7, type: :string
  field :icon, 8, type: :fixed32
end

defmodule Meshtastic.MqttClientProxyMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :topic, 1, type: :string
  field :data, 2, type: :bytes, oneof: 0
  field :text, 3, type: :string, oneof: 0
  field :retained, 4, type: :bool
end

defmodule Meshtastic.MeshPacket do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :from, 1, type: :fixed32
  field :to, 2, type: :fixed32
  field :channel, 3, type: :uint32
  field :decoded, 4, type: Meshtastic.Data, oneof: 0
  field :encrypted, 5, type: :bytes, oneof: 0
  field :id, 6, type: :fixed32
  field :rx_time, 7, type: :fixed32, json_name: "rxTime"
  field :rx_snr, 8, type: :float, json_name: "rxSnr"
  field :hop_limit, 9, type: :uint32, json_name: "hopLimit"
  field :want_ack, 10, type: :bool, json_name: "wantAck"
  field :priority, 11, type: Meshtastic.MeshPacket.Priority, enum: true
  field :rx_rssi, 12, type: :int32, json_name: "rxRssi"
  field :delayed, 13, type: Meshtastic.MeshPacket.Delayed, enum: true, deprecated: true
  field :via_mqtt, 14, type: :bool, json_name: "viaMqtt"
  field :hop_start, 15, type: :uint32, json_name: "hopStart"
  field :public_key, 16, type: :bytes, json_name: "publicKey"
  field :pki_encrypted, 17, type: :bool, json_name: "pkiEncrypted"
  field :next_hop, 18, type: :uint32, json_name: "nextHop"
  field :relay_node, 19, type: :uint32, json_name: "relayNode"
  field :tx_after, 20, type: :uint32, json_name: "txAfter"

  field :transport_mechanism, 21,
    type: Meshtastic.MeshPacket.TransportMechanism,
    json_name: "transportMechanism",
    enum: true
end

defmodule Meshtastic.NodeInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :num, 1, type: :uint32
  field :user, 2, type: Meshtastic.User
  field :position, 3, type: Meshtastic.Position
  field :snr, 4, type: :float
  field :last_heard, 5, type: :fixed32, json_name: "lastHeard"
  field :device_metrics, 6, type: Meshtastic.DeviceMetrics, json_name: "deviceMetrics"
  field :channel, 7, type: :uint32
  field :via_mqtt, 8, type: :bool, json_name: "viaMqtt"
  field :hops_away, 9, proto3_optional: true, type: :uint32, json_name: "hopsAway"
  field :is_favorite, 10, type: :bool, json_name: "isFavorite"
  field :is_ignored, 11, type: :bool, json_name: "isIgnored"
  field :is_key_manually_verified, 12, type: :bool, json_name: "isKeyManuallyVerified"
end

defmodule Meshtastic.MyNodeInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :my_node_num, 1, type: :uint32, json_name: "myNodeNum"
  field :reboot_count, 8, type: :uint32, json_name: "rebootCount"
  field :min_app_version, 11, type: :uint32, json_name: "minAppVersion"
  field :device_id, 12, type: :bytes, json_name: "deviceId"
  field :pio_env, 13, type: :string, json_name: "pioEnv"

  field :firmware_edition, 14,
    type: Meshtastic.FirmwareEdition,
    json_name: "firmwareEdition",
    enum: true

  field :nodedb_count, 15, type: :uint32, json_name: "nodedbCount"
end

defmodule Meshtastic.LogRecord do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :message, 1, type: :string
  field :time, 2, type: :fixed32
  field :source, 3, type: :string
  field :level, 4, type: Meshtastic.LogRecord.Level, enum: true
end

defmodule Meshtastic.QueueStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :res, 1, type: :int32
  field :free, 2, type: :uint32
  field :maxlen, 3, type: :uint32
  field :mesh_packet_id, 4, type: :uint32, json_name: "meshPacketId"
end

defmodule Meshtastic.FromRadio do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :id, 1, type: :uint32
  field :packet, 2, type: Meshtastic.MeshPacket, oneof: 0
  field :my_info, 3, type: Meshtastic.MyNodeInfo, json_name: "myInfo", oneof: 0
  field :node_info, 4, type: Meshtastic.NodeInfo, json_name: "nodeInfo", oneof: 0
  field :config, 5, type: Meshtastic.Config, oneof: 0
  field :log_record, 6, type: Meshtastic.LogRecord, json_name: "logRecord", oneof: 0
  field :config_complete_id, 7, type: :uint32, json_name: "configCompleteId", oneof: 0
  field :rebooted, 8, type: :bool, oneof: 0
  field :moduleConfig, 9, type: Meshtastic.ModuleConfig, oneof: 0
  field :channel, 10, type: Meshtastic.Channel, oneof: 0
  field :queueStatus, 11, type: Meshtastic.QueueStatus, oneof: 0
  field :xmodemPacket, 12, type: Meshtastic.XModem, oneof: 0
  field :metadata, 13, type: Meshtastic.DeviceMetadata, oneof: 0
  field :mqttClientProxyMessage, 14, type: Meshtastic.MqttClientProxyMessage, oneof: 0
  field :fileInfo, 15, type: Meshtastic.FileInfo, oneof: 0
  field :clientNotification, 16, type: Meshtastic.ClientNotification, oneof: 0
  field :deviceuiConfig, 17, type: Meshtastic.DeviceUIConfig, oneof: 0
end

defmodule Meshtastic.ClientNotification do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :reply_id, 1, proto3_optional: true, type: :uint32, json_name: "replyId"
  field :time, 2, type: :fixed32
  field :level, 3, type: Meshtastic.LogRecord.Level, enum: true
  field :message, 4, type: :string

  field :key_verification_number_inform, 11,
    type: Meshtastic.KeyVerificationNumberInform,
    json_name: "keyVerificationNumberInform",
    oneof: 0

  field :key_verification_number_request, 12,
    type: Meshtastic.KeyVerificationNumberRequest,
    json_name: "keyVerificationNumberRequest",
    oneof: 0

  field :key_verification_final, 13,
    type: Meshtastic.KeyVerificationFinal,
    json_name: "keyVerificationFinal",
    oneof: 0

  field :duplicated_public_key, 14,
    type: Meshtastic.DuplicatedPublicKey,
    json_name: "duplicatedPublicKey",
    oneof: 0

  field :low_entropy_key, 15, type: Meshtastic.LowEntropyKey, json_name: "lowEntropyKey", oneof: 0
end

defmodule Meshtastic.KeyVerificationNumberInform do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :nonce, 1, type: :uint64
  field :remote_longname, 2, type: :string, json_name: "remoteLongname"
  field :security_number, 3, type: :uint32, json_name: "securityNumber"
end

defmodule Meshtastic.KeyVerificationNumberRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :nonce, 1, type: :uint64
  field :remote_longname, 2, type: :string, json_name: "remoteLongname"
end

defmodule Meshtastic.KeyVerificationFinal do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :nonce, 1, type: :uint64
  field :remote_longname, 2, type: :string, json_name: "remoteLongname"
  field :isSender, 3, type: :bool
  field :verification_characters, 4, type: :string, json_name: "verificationCharacters"
end

defmodule Meshtastic.DuplicatedPublicKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Meshtastic.LowEntropyKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Meshtastic.FileInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :file_name, 1, type: :string, json_name: "fileName"
  field :size_bytes, 2, type: :uint32, json_name: "sizeBytes"
end

defmodule Meshtastic.ToRadio do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :packet, 1, type: Meshtastic.MeshPacket, oneof: 0
  field :want_config_id, 3, type: :uint32, json_name: "wantConfigId", oneof: 0
  field :disconnect, 4, type: :bool, oneof: 0
  field :xmodemPacket, 5, type: Meshtastic.XModem, oneof: 0
  field :mqttClientProxyMessage, 6, type: Meshtastic.MqttClientProxyMessage, oneof: 0
  field :heartbeat, 7, type: Meshtastic.Heartbeat, oneof: 0
end

defmodule Meshtastic.Compressed do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :portnum, 1, type: Meshtastic.PortNum, enum: true
  field :data, 2, type: :bytes
end

defmodule Meshtastic.NeighborInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_id, 1, type: :uint32, json_name: "nodeId"
  field :last_sent_by_id, 2, type: :uint32, json_name: "lastSentById"
  field :node_broadcast_interval_secs, 3, type: :uint32, json_name: "nodeBroadcastIntervalSecs"
  field :neighbors, 4, repeated: true, type: Meshtastic.Neighbor
end

defmodule Meshtastic.Neighbor do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_id, 1, type: :uint32, json_name: "nodeId"
  field :snr, 2, type: :float
  field :last_rx_time, 3, type: :fixed32, json_name: "lastRxTime"
  field :node_broadcast_interval_secs, 4, type: :uint32, json_name: "nodeBroadcastIntervalSecs"
end

defmodule Meshtastic.DeviceMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :firmware_version, 1, type: :string, json_name: "firmwareVersion"
  field :device_state_version, 2, type: :uint32, json_name: "deviceStateVersion"
  field :canShutdown, 3, type: :bool
  field :hasWifi, 4, type: :bool
  field :hasBluetooth, 5, type: :bool
  field :hasEthernet, 6, type: :bool
  field :role, 7, type: Meshtastic.Config.DeviceConfig.Role, enum: true
  field :position_flags, 8, type: :uint32, json_name: "positionFlags"
  field :hw_model, 9, type: Meshtastic.HardwareModel, json_name: "hwModel", enum: true
  field :hasRemoteHardware, 10, type: :bool
  field :hasPKC, 11, type: :bool
  field :excluded_modules, 12, type: :uint32, json_name: "excludedModules"
end

defmodule Meshtastic.Heartbeat do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :nonce, 1, type: :uint32
end

defmodule Meshtastic.NodeRemoteHardwarePin do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_num, 1, type: :uint32, json_name: "nodeNum"
  field :pin, 2, type: Meshtastic.RemoteHardwarePin
end

defmodule Meshtastic.ChunkedPayload do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :payload_id, 1, type: :uint32, json_name: "payloadId"
  field :chunk_count, 2, type: :uint32, json_name: "chunkCount"
  field :chunk_index, 3, type: :uint32, json_name: "chunkIndex"
  field :payload_chunk, 4, type: :bytes, json_name: "payloadChunk"
end

defmodule Meshtastic.ResendChunks do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :chunks, 1, repeated: true, type: :uint32
end

defmodule Meshtastic.ChunkedPayloadResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :payload_id, 1, type: :uint32, json_name: "payloadId"
  field :request_transfer, 2, type: :bool, json_name: "requestTransfer", oneof: 0
  field :accept_transfer, 3, type: :bool, json_name: "acceptTransfer", oneof: 0
  field :resend_chunks, 4, type: Meshtastic.ResendChunks, json_name: "resendChunks", oneof: 0
end
