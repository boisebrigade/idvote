defmodule IdvoteWeb.GraphQLTest do
  use IdvoteWeb.ConnCase, async: true

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

  @query_frontend """
    query GetPrecinct($address: String!) {
      precinct(address: $address) {
        name
        address
        closingTime
        openingTime
        date
        geometry
        addressGeoencoded {
          srid,
          coordinates {
            x y
          }
        }
      }
    }
  """

  @query_twilio """
    query GetPrecinct($address: String!) {
      precinct(address: $address) {
      name
      address
      closingTime
      openingTime
      date
    }
  }
  """

  setup do
    mock(fn
      %{method: :get, url: @mock_url} ->
        %Tesla.Env{status: 200, body: @mock_location}
    end)

    :ok
  end

  test "querying precinct with an address will return all fields required by frontend" do
    result =
      Absinthe.run(@query_frontend, Idvote.Schema, variables: %{"address" => @dummy_address})

    assert {:ok, _} = result

    assert {:ok,
            %{
              data: %{
                "precinct" => %{
                  "address" => _,
                  "addressGeoencoded" => %{
                    "coordinates" => [%{"x" => _, "y" => _}],
                    "srid" => _
                  },
                  "closingTime" => _,
                  "date" => _,
                  "geometry" => _,
                  "name" => _,
                  "openingTime" => _
                }
              }
            }} = result
  end

  test "querying precinct with an address will return all fields required by twilio" do
    result = Absinthe.run(@query_twilio, Idvote.Schema, variables: %{"address" => @dummy_address})

    assert {:ok, _} = result

    assert {:ok,
            %{
              data: %{
                "precinct" => %{
                  "address" => _,
                  "name" => _,
                  "date" => _,
                  "closingTime" => _,
                  "openingTime" => _
                }
              }
            }} = result
  end
end
