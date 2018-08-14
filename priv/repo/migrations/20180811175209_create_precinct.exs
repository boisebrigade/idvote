defmodule Idvote.Repo.Migrations.CreatePrecinct do
  use Ecto.Migration

  def up do
    create table(:precinct) do
      add(:name, :string)
      add(:gid, :integer)
      add(:address, :string)
      add(:county, :string)
      add(:geometry, :geometry)
      add(:opening_time, :time)
      add(:closing_time, :time)
      add(:date, :date)
    end
  end
end
