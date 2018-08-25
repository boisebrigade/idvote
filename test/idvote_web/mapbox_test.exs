defmodule IdvoteWeb.MapboxTest do
  use IdvoteWeb.ConnCase, async: true

  import Tesla.Mock

  @dummy_address "123 Joe Dirt Rd"

  @mock_url "https://api.mapbox.com/geocoding/v5/mapbox.places/" <>
            URI.encode(@dummy_address) <> ".json"

  setup do
    mock(fn
      env = %{method: :get} ->
        send self(), env
    end)

    :ok
  end

  test "our mapbox Geoencode has the correct encoding and query parameters" do
    request = Idvote.Mapbox.geoencode(@dummy_address)

    assert {:ok, _} = request
    assert {:ok,  %Tesla.Env{query: %{access_token: _, bbox: _, country: _, limit: _, proximity: _, types: _}}} = request
    assert {:ok, %Tesla.Env{url: @mock_url}} = request
  end
end
