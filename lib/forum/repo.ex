defmodule Forum.Repo do
  use Ecto.Repo,
    otp_app: :forum,
    adapter: Ecto.Adapters.Postgres
end
