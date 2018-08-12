defmodule IdvoteWeb.WebController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct
  alias Idvote.Mapbox.Geoencode

  def find(conn, params = %{"Address" => address}) do
    %{"features" => features} = Geoencode.encode(address)

    %{"center" => [x, y]} = features |> Enum.at(0)

    %Precinct{address: address} = Precinct.find(%Geo.Point{coordinates: {x, y}, srid: 4269})

    json conn, %{"Address" => address, "Time" => "8:00 am to 8:00 pm"}
  end
end
