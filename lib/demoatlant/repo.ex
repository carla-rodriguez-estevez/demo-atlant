defmodule Demoatlant.Repo do
  use Ecto.Repo,
    otp_app: :demoatlant,
    adapter: Ecto.Adapters.Postgres
end
