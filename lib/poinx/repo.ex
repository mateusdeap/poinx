defmodule Poinx.Repo do
  use Ecto.Repo,
    otp_app: :poinx,
    adapter: Ecto.Adapters.Postgres
end
