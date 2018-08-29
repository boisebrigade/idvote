defmodule Idvote.Precinct do
  use Ecto.Schema

  alias Idvote.{Repo, Precinct}

  import Geo.PostGIS
  import Ecto.{Query, Changeset}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:gid, :county, :name, :address, :opening_time, :closing_time, :date, :geometry]

  schema "precinct" do
    field(:gid, :integer)
    field(:county, :string)

    field(:name, :string)
    field(:address, :string)
    field(:address_geoencoded, Geo.PostGIS.Geometry)

    field(:opening_time, :time)
    field(:closing_time, :time)
    field(:date, :date)

    field(:geometry, Geo.PostGIS.Geometry)
  end

  def changeset(precinct, attrs) do
    precinct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:county, name: :precinct_county_gid_index)
  end

  def find_by_id(id) do
    from(
      p in Precinct,
      where: p.id == ^id
    )
    |> Repo.one!()
  end

  def find_by_point(geom) do
    from(
      p in Precinct,
      where: st_contains(p.geometry, ^geom),
      select: %{p | geometry: fragment("ST_AsGeoJSON(?)", p.geometry)}
    )
    |> Repo.one!()
  end
end
