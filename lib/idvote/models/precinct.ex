defmodule Idvote.Precinct do
  use Ecto.Schema

  alias Idvote.{Repo, Precinct}
  alias Idvote.Mapbox.Geoencode

  import Geo.PostGIS
  import Ecto.{Query, Changeset}

  schema "precinct" do
    field(:gid, :integer)
    field(:name, :string)
    field(:address, :string)
    field(:geometry, Geo.PostGIS.Geometry)
    field(:county, :string)
    field(:opening_time, :time)
    field(:closing_time, :time)
    field(:date, :date)
  end

  @doc false
  def changeset(precinct, attrs) do
    precinct
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def find_by_address(address) do
    {:ok, %Tesla.Env{body: %{"features" => [%{"center" => [x, y]}]}}} = Geoencode.encode(address)

    find(%Geo.Point{coordinates: {x, y}, srid: 4269})
  end

  defp find(geom) do
    from(
      p in Precinct,
      where: st_contains(p.geometry, ^geom)
    )
    |> Repo.one()
  end
end
