defmodule PbExtension do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0"

  extend Google.Protobuf.FileOptions, :nanopb_fileopt, 1010,
    optional: true,
    type: NanoPBOptions,
    json_name: "nanopbFileopt"

  extend Google.Protobuf.MessageOptions, :nanopb_msgopt, 1010,
    optional: true,
    type: NanoPBOptions,
    json_name: "nanopbMsgopt"

  extend Google.Protobuf.EnumOptions, :nanopb_enumopt, 1010,
    optional: true,
    type: NanoPBOptions,
    json_name: "nanopbEnumopt"

  extend Google.Protobuf.FieldOptions, :nanopb, 1010, optional: true, type: NanoPBOptions
end
