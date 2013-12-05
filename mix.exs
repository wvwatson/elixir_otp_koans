defmodule ElixirOtpKoans.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_otp_koans,
      version: "0.0.1",
      elixir: "~> 0.10.0",
      dynamos: [ElixirOtpKoans.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/elixir_otp_koans/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { ElixirOtpKoans, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :exlager, github: "khia/exlager" }, 
      { :dynamo, branch: "edwb-2", github: "clutchanalytics/dynamo" } ]
  end

  def options(env) when env in [:dev, :test] do
    [exlager_level: :info, exlager_truncation_size: 8096]
  end
end
