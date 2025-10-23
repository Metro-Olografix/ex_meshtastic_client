defmodule MeshtasticClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :meshtastic_client,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      package: package(),
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
      {:protobuf, "~> 0.15.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "meshtastic_client",
      description: "Elixir client for Meshtastic devices using Protobuf",
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/Metro-Olografix/ex_meshtastic_client"}
    ]
  end
end
