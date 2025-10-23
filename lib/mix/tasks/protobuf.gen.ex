defmodule Mix.Tasks.Protobuf.Gen do
  @moduledoc """
  Generates Elixir modules from protobuf definitions.

  This task compiles all .proto files in priv/protos/ directory into
  Elixir modules using protoc and the protobuf Elixir plugin.

  ## Prerequisites

  You must have protoc installed:

      # Fedora/RHEL
      sudo dnf install protobuf-compiler

      # Ubuntu/Debian
      sudo apt-get install protobuf-compiler

      # macOS
      brew install protobuf

  You also need the Elixir protobuf plugin:

      mix escript.install hex protobuf 0.14.0

  ## Usage

      mix protobuf.gen

  This will generate Elixir modules in lib/meshtastic/proto/ from all
  .proto files found in priv/protos/.

  ## Options

      --proto-path PATH  - Source directory for .proto files (default: priv/protos)
      --output-path PATH - Output directory for generated modules (default: lib/meshtastic/proto)
      --clean            - Remove generated files before regenerating
  """

  use Mix.Task

  @shortdoc "Generate Elixir modules from protobuf definitions"

  @default_proto_path "priv/protos"
  @default_output_path "lib/meshtastic/proto"

  @impl Mix.Task
  def run(args) do
    {opts, _} = OptionParser.parse!(args,
      strict: [
        proto_path: :string,
        output_path: :string,
        clean: :boolean
      ]
    )

    proto_path = Keyword.get(opts, :proto_path, @default_proto_path)
    output_path = Keyword.get(opts, :output_path, @default_output_path)
    clean? = Keyword.get(opts, :clean, false)

    Mix.shell().info("Generating protobuf modules...")
    Mix.shell().info("  Proto source: #{proto_path}")
    Mix.shell().info("  Output path: #{output_path}")

    # Check if protoc and protoc-gen-elixir are available
    check_protoc_installed!()
    check_protoc_gen_elixir_installed!()

    # Clean output directory if requested
    if clean? do
      Mix.shell().info("Cleaning output directory...")
      File.rm_rf!(output_path)
    end

    # Ensure output directory exists
    File.mkdir_p!(output_path)

    # Find all .proto files
    proto_files = find_proto_files(proto_path)

    if Enum.empty?(proto_files) do
      Mix.shell().error("No .proto files found in #{proto_path}")
      exit({:shutdown, 1})
    end

    Mix.shell().info("Found #{length(proto_files)} proto files")

    # Run protoc
    run_protoc(proto_path, output_path, proto_files)

    Mix.shell().info("Done! Generated modules in #{output_path}")
  end

  defp check_protoc_installed! do
    case System.cmd("which", ["protoc"], stderr_to_stdout: true) do
      {_, 0} ->
        :ok

      _ ->
        Mix.shell().error("""
        protoc not found!

        Please install the Protocol Buffers compiler:

          # Fedora/RHEL
          sudo dnf install protobuf-compiler

          # Ubuntu/Debian
          sudo apt-get install protobuf-compiler

          # macOS
          brew install protobuf
        """)
        exit({:shutdown, 1})
    end
  end

  defp check_protoc_gen_elixir_installed! do
    case System.cmd("which", ["protoc-gen-elixir"], stderr_to_stdout: true) do
      {_, 0} ->
        :ok

      _ ->
        Mix.shell().error("""
        protoc-gen-elixir not found!

        Please install the Elixir protobuf plugin:

          $ mix escript.install hex protobuf 0.14.0

        Make sure ~/.mix/escripts is in your PATH:

          export PATH="$HOME/.mix/escripts:$PATH"

        Add this to your ~/.bashrc or ~/.zshrc to make it permanent.
        """)
        exit({:shutdown, 1})
    end
  end

  defp find_proto_files(proto_path) do
    proto_path
    |> Path.join("*.proto")
    |> Path.wildcard()
    |> Enum.map(&Path.basename/1)
  end

  defp run_protoc(proto_path, output_path, proto_files) do
    # Include multiple proto paths:
    # - Current directory for root-level nanopb.proto
    # - priv/protos for meshtastic proto files
    # - System include path for google/protobuf descriptors
    args = [
      "--proto_path=.",
      "--proto_path=#{proto_path}",
      "--elixir_out=#{output_path}"
      | proto_files
    ]

    case System.cmd("protoc", args, stderr_to_stdout: true) do
      {output, 0} ->
        if output != "" do
          Mix.shell().info(output)
        end
        :ok

      {output, code} ->
        Mix.shell().error("protoc failed with exit code #{code}")
        Mix.shell().error(output)
        exit({:shutdown, 1})
    end
  end
end
