defmodule Idvote.Mapbox do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.mapbox.com/geocoding/v5/")

  # Define vnd.geo as JSON as Tesla doesn't natively recongize it as such
  plug(Tesla.Middleware.JSON, decode_content_types: ["application/vnd.geo+json"])

  def geoencode(address) do
    places(address, %{limit: 1})
  end

  def autocomplete(address) do
    places(address, %{autocomplete: true})
  end

  defp places(address, options) do
    query_params =
      Map.merge(options, %{
        country: "US",
        types: "address",
        access_token: System.get_env("MAPBOX_ACCESS_TOKEN"),
        proximity: "-116.2044,43.615",
        bbox: "-117, 41, -110, 49"
      })

    get(
      "mapbox.places/" <> URI.encode(address) <> ".json",
      query: query_params
    )
  end
end
