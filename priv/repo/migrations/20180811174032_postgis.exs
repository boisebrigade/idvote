defmodule Idvote.Repo.Migrations.Postgis do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
  end
end
