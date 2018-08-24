defmodule Idvote.Repo.Migrations.CreatePrecinct do
  use Ecto.Migration

  def up do
    create table(:precinct, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:gid, :integer)
      add(:county, :string)

      add(:name, :string)
      add(:address, :string)
      add(:address_geoencoded, :geometry)

      add(:opening_time, :time)
      add(:closing_time, :time)
      add(:date, :date)

      add(:geometry, :geometry)
    end

    create unique_index(:precinct, [:county, :gid])
  end
end
