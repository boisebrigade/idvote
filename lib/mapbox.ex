defmodule Idvote.Mapbox.Geoencode do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.mapbox.com/geocoding/v5/mapbox.places/")

  plug(Tesla.Middleware.Query, %{
    country: "US",
    types: "address",
    limit: 1,
    access_token: System.get_env("MAPBOX_ACCESS_TOKEN"),
    proximity: "-116.2044,43.615",
    bbox: "-117, 41, -110, 49"
  })

  # Define vnd.geo as JSON as Tesla doesn't natively recongize it as such
  plug(Tesla.Middleware.JSON, decode_content_types: ["application/vnd.geo+json"])

  def encode(address) do
    get(URI.encode(address) <> ".json")
  end
end
