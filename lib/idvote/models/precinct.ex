defmodule Idvote.Precinct do
  use Ecto.Schema

  alias Idvote.{Repo, Precinct}
  import Geo.PostGIS
  import Ecto.{Query, Changeset}

  schema "precinct" do
    field(:gid, :integer)
    field(:name, :string)
    field(:address, :string)
    field(:geometry, Geo.PostGIS.Geometry)
    field(:time, :time)
    field(:date, :date)
  end

  @doc false
  def changeset(precinct, attrs) do
    precinct
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def find(geom) do
    from(
      p in Precinct,
      where: st_contains(p.geometry, ^geom)
    )
    |> Repo.one()
  end
end
