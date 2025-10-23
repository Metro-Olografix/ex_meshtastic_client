defmodule Meshtastic.CannedMessageModuleConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :messages, 1, type: :string
end
