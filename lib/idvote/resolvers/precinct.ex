defmodule Idvote.Resolver.Precincts do
  alias Idvote.Precinct
  alias Idvote.Mapbox

  require Logger

  @date_format "%m/%d/%Y"
  @time_format "%I:%M %p"

  def find(%{id: id}) do
  end

  def find(%{}, %{address: address}, _) do
    try do
      case find_by_address(address) do
        precinct = %Precinct{
          opening_time: opening_time,
          closing_time: closing_time,
          date: date,
          geometry: geometry,
          address_geoencoded: address_geoencoded
        } ->
          %Geo.Point{srid: address_srid, coordinates: {x, y}} = address_geoencoded

          opening_time = Timex.format!(opening_time, @time_format, :strftime)
          closing_time = Timex.format!(closing_time, @time_format, :strftime)

          date = Timex.format!(date, @date_format, :strftime)

          {:ok,
           %{
             precinct
             | opening_time: opening_time,
               closing_time: closing_time,
               date: date,
               address_geoencoded: %{srid: address_srid, coordinates: %{:x => x, :y => y}}
           }}

        error when not is_nil(error) ->
          {:error, error}

        nil ->
          {:error, "Please try again later"}
      end
    rescue
      Ecto.NoResultsError -> {:error, "Unable to find polling place"}
    end
  end

  def autocomplete(%{}, %{address: address}, _) do
    Mapbox.autocomplete(address)
    |> IO.inspect
    |> case  do
      {:ok, %Tesla.Env{status: 200, body: %{"features" => locations}}} ->
        suggestions =
          Enum.reduce(locations, [], fn
            %{"place_name" => location, "place_type" => ["address"]}, acc -> [location | acc]
            _, acc -> acc
          end)
          |> Enum.reverse()

        {:ok, %{suggestions: suggestions}}

      # Mapbox didn't like our query
      {:ok, %Tesla.Env{body: %{"message" => message}}} ->
        {:error, message}

      # Our query has failed
      _ ->
        {:error, "Not Implemented"}
    end
  end

  defp find_by_address(address) do
    IO.inspect Mapbox.geoencode(address)
    case Mapbox.geoencode(address) do
      # If we get back a result with a X and Y
      {:ok, %Tesla.Env{status: 200, body: %{"features" => [%{"center" => [x, y]}]}}} ->
        Precinct.find_by_point(%Geo.Point{coordinates: {x, y}, srid: 4269})

      # If we get back a result but it is outside the boundaries or the address queried has no matches (most likely the former)
      {:ok, %Tesla.Env{status: 200, body: %{"features" => []}}} ->
        "Sorry, we were unable to find a polling place for: #{address}"

      # Mapbox didn't like our query
      {:ok, %Tesla.Env{body: %{"message" => message}}} ->
        Logger.error(message)

        "Please try again later"

      # Our query has failed
      _ ->
        nil
    end
  end
end
