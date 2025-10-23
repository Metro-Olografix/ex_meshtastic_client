defmodule Meshtastic.PowerMon.State do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :None, 0
  field :CPU_DeepSleep, 1
  field :CPU_LightSleep, 2
  field :Vext1_On, 4
  field :Lora_RXOn, 8
  field :Lora_TXOn, 16
  field :Lora_RXActive, 32
  field :BT_On, 64
  field :LED_On, 128
  field :Screen_On, 256
  field :Screen_Drawing, 512
  field :Wifi_On, 1024
  field :GPS_Active, 2048
end

defmodule Meshtastic.PowerStressMessage.Opcode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSET, 0
  field :PRINT_INFO, 1
  field :FORCE_QUIET, 2
  field :END_QUIET, 3
  field :SCREEN_ON, 16
  field :SCREEN_OFF, 17
  field :CPU_IDLE, 32
  field :CPU_DEEPSLEEP, 33
  field :CPU_FULLON, 34
  field :LED_ON, 48
  field :LED_OFF, 49
  field :LORA_OFF, 64
  field :LORA_TX, 65
  field :LORA_RX, 66
  field :BT_OFF, 80
  field :BT_ON, 81
  field :WIFI_OFF, 96
  field :WIFI_ON, 97
  field :GPS_OFF, 112
  field :GPS_ON, 113
end

defmodule Meshtastic.PowerMon do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Meshtastic.PowerStressMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cmd, 1, type: Meshtastic.PowerStressMessage.Opcode, enum: true
  field :num_seconds, 2, type: :float, json_name: "numSeconds"
end
