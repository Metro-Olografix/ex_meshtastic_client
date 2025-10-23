defmodule Meshtastic.PortNum do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN_APP, 0
  field :TEXT_MESSAGE_APP, 1
  field :REMOTE_HARDWARE_APP, 2
  field :POSITION_APP, 3
  field :NODEINFO_APP, 4
  field :ROUTING_APP, 5
  field :ADMIN_APP, 6
  field :TEXT_MESSAGE_COMPRESSED_APP, 7
  field :WAYPOINT_APP, 8
  field :AUDIO_APP, 9
  field :DETECTION_SENSOR_APP, 10
  field :ALERT_APP, 11
  field :KEY_VERIFICATION_APP, 12
  field :REPLY_APP, 32
  field :IP_TUNNEL_APP, 33
  field :PAXCOUNTER_APP, 34
  field :SERIAL_APP, 64
  field :STORE_FORWARD_APP, 65
  field :RANGE_TEST_APP, 66
  field :TELEMETRY_APP, 67
  field :ZPS_APP, 68
  field :SIMULATOR_APP, 69
  field :TRACEROUTE_APP, 70
  field :NEIGHBORINFO_APP, 71
  field :ATAK_PLUGIN, 72
  field :MAP_REPORT_APP, 73
  field :POWERSTRESS_APP, 74
  field :RETICULUM_TUNNEL_APP, 76
  field :CAYENNE_APP, 77
  field :PRIVATE_APP, 256
  field :ATAK_FORWARDER, 257
  field :MAX, 511
end
