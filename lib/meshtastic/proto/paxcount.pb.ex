defmodule Meshtastic.Paxcount do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :wifi, 1, type: :uint32
  field :ble, 2, type: :uint32
  field :uptime, 3, type: :uint32
end
