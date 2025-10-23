defmodule MeshtasticClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :meshtastic_client,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:protobuf, "~> 0.15.0"}
    ]
  end
end
