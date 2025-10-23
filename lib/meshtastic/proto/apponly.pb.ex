defmodule Meshtastic.ChannelSet do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :settings, 1, repeated: true, type: Meshtastic.ChannelSettings
  field :lora_config, 2, type: Meshtastic.Config.LoRaConfig, json_name: "loraConfig"
end
