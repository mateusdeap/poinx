defmodule Poinx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Poinx.Repo,
      # Start the Telemetry supervisor
      PoinxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Poinx.PubSub},
      # Start the Endpoint (http/https)
      PoinxWeb.Endpoint
      # Start a worker by calling: Poinx.Worker.start_link(arg)
      # {Poinx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Poinx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PoinxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
