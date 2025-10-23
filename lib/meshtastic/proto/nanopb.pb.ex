defmodule FieldType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :FT_DEFAULT, 0
  field :FT_CALLBACK, 1
  field :FT_POINTER, 4
  field :FT_STATIC, 2
  field :FT_IGNORE, 3
  field :FT_INLINE, 5
end

defmodule IntSize do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :IS_DEFAULT, 0
  field :IS_8, 8
  field :IS_16, 16
  field :IS_32, 32
  field :IS_64, 64
end

defmodule TypenameMangling do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :M_NONE, 0
  field :M_STRIP_PACKAGE, 1
  field :M_FLATTEN, 2
  field :M_PACKAGE_INITIALS, 3
end

defmodule DescriptorSize do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :DS_AUTO, 0
  field :DS_1, 1
  field :DS_2, 2
  field :DS_4, 4
  field :DS_8, 8
end

defmodule NanoPBOptions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :max_size, 1, optional: true, type: :int32, json_name: "maxSize"
  field :max_length, 14, optional: true, type: :int32, json_name: "maxLength"
  field :max_count, 2, optional: true, type: :int32, json_name: "maxCount"

  field :int_size, 7,
    optional: true,
    type: IntSize,
    json_name: "intSize",
    default: :IS_DEFAULT,
    enum: true

  field :type, 3, optional: true, type: FieldType, default: :FT_DEFAULT, enum: true
  field :long_names, 4, optional: true, type: :bool, json_name: "longNames", default: true
  field :packed_struct, 5, optional: true, type: :bool, json_name: "packedStruct", default: false
  field :packed_enum, 10, optional: true, type: :bool, json_name: "packedEnum", default: false
  field :skip_message, 6, optional: true, type: :bool, json_name: "skipMessage", default: false
  field :no_unions, 8, optional: true, type: :bool, json_name: "noUnions", default: false
  field :msgid, 9, optional: true, type: :uint32

  field :anonymous_oneof, 11,
    optional: true,
    type: :bool,
    json_name: "anonymousOneof",
    default: false

  field :proto3, 12, optional: true, type: :bool, default: false

  field :proto3_singular_msgs, 21,
    optional: true,
    type: :bool,
    json_name: "proto3SingularMsgs",
    default: false

  field :enum_to_string, 13,
    optional: true,
    type: :bool,
    json_name: "enumToString",
    default: false

  field :fixed_length, 15, optional: true, type: :bool, json_name: "fixedLength", default: false
  field :fixed_count, 16, optional: true, type: :bool, json_name: "fixedCount", default: false

  field :submsg_callback, 22,
    optional: true,
    type: :bool,
    json_name: "submsgCallback",
    default: false

  field :mangle_names, 17,
    optional: true,
    type: TypenameMangling,
    json_name: "mangleNames",
    default: :M_NONE,
    enum: true

  field :callback_datatype, 18,
    optional: true,
    type: :string,
    json_name: "callbackDatatype",
    default: "pb_callback_t"

  field :callback_function, 19,
    optional: true,
    type: :string,
    json_name: "callbackFunction",
    default: "pb_default_field_callback"

  field :descriptorsize, 20, optional: true, type: DescriptorSize, default: :DS_AUTO, enum: true
  field :default_has, 23, optional: true, type: :bool, json_name: "defaultHas", default: false
  field :include, 24, repeated: true, type: :string
  field :exclude, 26, repeated: true, type: :string
  field :package, 25, optional: true, type: :string

  field :type_override, 27,
    optional: true,
    type: Google.Protobuf.FieldDescriptorProto.Type,
    json_name: "typeOverride",
    enum: true

  field :sort_by_tag, 28, optional: true, type: :bool, json_name: "sortByTag", default: true

  field :fallback_type, 29,
    optional: true,
    type: FieldType,
    json_name: "fallbackType",
    default: :FT_CALLBACK,
    enum: true
end
