defmodule Meshtastic.HardwareMessage.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :WRITE_GPIOS, 1
  field :WATCH_GPIOS, 2
  field :GPIOS_CHANGED, 3
  field :READ_GPIOS, 4
  field :READ_GPIOS_REPLY, 5
end

defmodule Meshtastic.HardwareMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :type, 1, type: Meshtastic.HardwareMessage.Type, enum: true
  field :gpio_mask, 2, type: :uint64, json_name: "gpioMask"
  field :gpio_value, 3, type: :uint64, json_name: "gpioValue"
end
