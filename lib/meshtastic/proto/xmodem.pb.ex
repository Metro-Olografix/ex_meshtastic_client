defmodule Meshtastic.XModem.Control do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NUL, 0
  field :SOH, 1
  field :STX, 2
  field :EOT, 4
  field :ACK, 6
  field :NAK, 21
  field :CAN, 24
  field :CTRLZ, 26
end

defmodule Meshtastic.XModem do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :control, 1, type: Meshtastic.XModem.Control, enum: true
  field :seq, 2, type: :uint32
  field :crc16, 3, type: :uint32
  field :buffer, 4, type: :bytes
end
