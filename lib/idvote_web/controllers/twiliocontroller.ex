defmodule IdvoteWeb.TwilioController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct
  alias Idvote.Mapbox.Geoencode

  alias IdvoteWeb.Twiml

  def sms(conn, %{"Body" => address}) do
    %{"features" => features} = Geoencode.encode(address)

    %{"center" => [x, y]} = features |> Enum.at(0)

    %Precinct{address: address} = Precinct.find(%Geo.Point{coordinates: {x, y}, srid: 4269})

    response = "Your polling location is at #{address}"

    conn
    |> encode(response)
  end

  defp encode(conn, response) do
    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, Twiml.sms(response))
  end
end
