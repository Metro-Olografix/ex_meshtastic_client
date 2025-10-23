defmodule Meshtastic.Team do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :Unspecifed_Color, 0
  field :White, 1
  field :Yellow, 2
  field :Orange, 3
  field :Magenta, 4
  field :Red, 5
  field :Maroon, 6
  field :Purple, 7
  field :Dark_Blue, 8
  field :Blue, 9
  field :Cyan, 10
  field :Teal, 11
  field :Green, 12
  field :Dark_Green, 13
  field :Brown, 14
end

defmodule Meshtastic.MemberRole do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :Unspecifed, 0
  field :TeamMember, 1
  field :TeamLead, 2
  field :HQ, 3
  field :Sniper, 4
  field :Medic, 5
  field :ForwardObserver, 6
  field :RTO, 7
  field :K9, 8
end

defmodule Meshtastic.TAKPacket do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload_variant, 0

  field :is_compressed, 1, type: :bool, json_name: "isCompressed"
  field :contact, 2, type: Meshtastic.Contact
  field :group, 3, type: Meshtastic.Group
  field :status, 4, type: Meshtastic.Status
  field :pli, 5, type: Meshtastic.PLI, oneof: 0
  field :chat, 6, type: Meshtastic.GeoChat, oneof: 0
  field :detail, 7, type: :bytes, oneof: 0
end

defmodule Meshtastic.GeoChat do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :message, 1, type: :string
  field :to, 2, proto3_optional: true, type: :string
  field :to_callsign, 3, proto3_optional: true, type: :string, json_name: "toCallsign"
end

defmodule Meshtastic.Group do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :role, 1, type: Meshtastic.MemberRole, enum: true
  field :team, 2, type: Meshtastic.Team, enum: true
end

defmodule Meshtastic.Status do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :battery, 1, type: :uint32
end

defmodule Meshtastic.Contact do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :callsign, 1, type: :string
  field :device_callsign, 2, type: :string, json_name: "deviceCallsign"
end

defmodule Meshtastic.PLI do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :latitude_i, 1, type: :sfixed32, json_name: "latitudeI"
  field :longitude_i, 2, type: :sfixed32, json_name: "longitudeI"
  field :altitude, 3, type: :int32
  field :speed, 4, type: :uint32
  field :course, 5, type: :uint32
end
