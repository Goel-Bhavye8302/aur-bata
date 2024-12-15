defmodule Aurbata.Repo do
  use Ecto.Repo,
    otp_app: :aurbata,
    adapter: Ecto.Adapters.Postgres
end
