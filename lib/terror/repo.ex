defmodule Terror.Repo do
  use Ecto.Repo,
    otp_app: :terror,
    adapter: Ecto.Adapters.Postgres
end
