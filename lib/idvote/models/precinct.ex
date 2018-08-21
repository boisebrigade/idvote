defmodule Idvote.Precinct do
  use Ecto.Schema

  alias Idvote.{Repo, Precinct}
  alias Idvote.Mapbox.Geoencode

  import Geo.PostGIS
  import Ecto.{Query, Changeset}

  require Logger

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
