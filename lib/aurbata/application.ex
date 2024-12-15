defmodule Aurbata.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AurbataWeb.Telemetry,
      Aurbata.Repo,
      {DNSCluster, query: Application.get_env(:aurbata, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Aurbata.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Aurbata.Finch},
      # Start a worker by calling: Aurbata.Worker.start_link(arg)
      # {Aurbata.Worker, arg},
      # Start to serve requests, typically the last entry
      AurbataWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Aurbata.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AurbataWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
