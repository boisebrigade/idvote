defmodule IdvoteWeb.PrecinctTest do
  use IdvoteWeb.ConnCase, async: true

  alias Idvote.Precinct

  import Tesla.Mock

  @dummy_address "123 Joe Dirt Rd"

  @mock_url "https://api.mapbox.com/geocoding/v5/mapbox.places/" <>
              URI.encode(@dummy_address) <> ".json"

  @mock_location %{
    "features" => [
      %{
        "center" => [5, 5]
      }
    ]
  }

  setup do
    mock(fn
      %{method: :get, url: @mock_url} ->
        %Tesla.Env{status: 200, body: @mock_location}
    end)

    :ok
  end

  test "given an a valid address we get a precinct with an address, name, date, opening time and closing time" do
    assert %Precinct{address: _, name: _, date: _, opening_time: _, closing_time: _} =
             Precinct.find_by_address(@dummy_address)
  end
end
