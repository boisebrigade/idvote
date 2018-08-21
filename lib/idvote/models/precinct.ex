defmodule Idvote.Precinct do
  use Ecto.Schema

  alias Idvote.{Repo, Precinct}
  alias Idvote.Mapbox.Geoencode

  import Geo.PostGIS
  import Ecto.{Query, Changeset}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:gid, :county, :name, :address, :opening_time, :closing_time, :date, :geometry]

  schema "precinct" do
    field(:gid, :integer)
    field(:county, :string)

    field(:name, :string)
    field(:address, :string)
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

  def find_by_address(address) do
    case Geoencode.encode(address) do
      {:ok, %Tesla.Env{status: 200, body: %{"features" => [%{"center" => [x, y]}]}}} ->
        precinct = find(%Geo.Point{coordinates: {x, y}, srid: 4269})

        if precinct do
          precinct
        else
          %Precinct{}
        end

      {:ok, %Tesla.Env{status: 200, body: %{"features" => []}}} ->
        %Precinct{}

      {:ok, %Tesla.Env{body: %{"message" => message}}} ->
        Logger.error(message)

      _ ->
        nil
    end
  end

  defp find(geom) do
    from(
      p in Precinct,
      where: st_contains(p.geometry, ^geom)
    )
    |> Repo.one()
  end
end
