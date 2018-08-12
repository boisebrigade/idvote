defmodule Idvote.Mapbox.Geoencode do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.mapbox.com/geocoding/v5/mapbox.places/")
  plug(Tesla.Middleware.Query, access_token: System.get_env("MAPBOX_ACCESS_TOKEN"))
  plug(Tesla.Middleware.JSON)

  def encode(address) do
    case get(URI.encode(address) <> ".json") do
      {:ok, %Tesla.Env{body: body}} -> Jason.decode!(body)
      {:error, _} -> :error
    end
  end
end
