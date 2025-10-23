defmodule Meshtastic.StoreAndForward.RequestResponse do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :ROUTER_ERROR, 1
  field :ROUTER_HEARTBEAT, 2
  field :ROUTER_PING, 3
  field :ROUTER_PONG, 4
  field :ROUTER_BUSY, 5
  field :ROUTER_HISTORY, 6
  field :ROUTER_STATS, 7
  field :ROUTER_TEXT_DIRECT, 8
  field :ROUTER_TEXT_BROADCAST, 9
  field :CLIENT_ERROR, 64
  field :CLIENT_HISTORY, 65
  field :CLIENT_STATS, 66
  field :CLIENT_PING, 67
  field :CLIENT_PONG, 68
  field :CLIENT_ABORT, 106
end

defmodule Meshtastic.StoreAndForward.Statistics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :messages_total, 1, type: :uint32, json_name: "messagesTotal"
  field :messages_saved, 2, type: :uint32, json_name: "messagesSaved"
  field :messages_max, 3, type: :uint32, json_name: "messagesMax"
  field :up_time, 4, type: :uint32, json_name: "upTime"
  field :requests, 5, type: :uint32
  field :requests_history, 6, type: :uint32, json_name: "requestsHistory"
  field :heartbeat, 7, type: :bool
  field :return_max, 8, type: :uint32, json_name: "returnMax"
  field :return_window, 9, type: :uint32, json_name: "returnWindow"
end

defmodule Meshtastic.StoreAndForward.History do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :history_messages, 1, type: :uint32, json_name: "historyMessages"
  field :window, 2, type: :uint32
  field :last_request, 3, type: :uint32, json_name: "lastRequest"
end

defmodule Meshtastic.StoreAndForward.Heartbeat do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :period, 1, type: :uint32
  field :secondary, 2, type: :uint32
end

defmodule Meshtastic.StoreAndForward do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :variant, 0

  field :rr, 1, type: Meshtastic.StoreAndForward.RequestResponse, enum: true
  field :stats, 2, type: Meshtastic.StoreAndForward.Statistics, oneof: 0
  field :history, 3, type: Meshtastic.StoreAndForward.History, oneof: 0
  field :heartbeat, 4, type: Meshtastic.StoreAndForward.Heartbeat, oneof: 0
  field :text, 5, type: :bytes, oneof: 0
end
