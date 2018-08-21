defmodule IdvoteWeb.WebController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct

  @date_format "%m/%d/%Y"
  @time_format "%I:%M %p"

  def find(conn, %{"address" => street_address}) do
    case Precinct.find_by_address(street_address) do
      %Precinct{
        id: id,
        name: name,
        address: polling_place_address,
        opening_time: opening_time,
        closing_time: closing_time,
        geometry: precinct,
        date: date
      } when not is_nil(id)->
        opening_time = Timex.format!(opening_time, @time_format, :strftime)
        closing_time = Timex.format!(closing_time, @time_format, :strftime)

        date = Timex.format!(date, @date_format, :strftime)

        json(conn, %{
          "name" => name,
          "address" => polling_place_address,
          "opening_time" => opening_time,
          "closing_time" => closing_time,
          "precinct" => precinct,
          "date" => date
        })

      %Precinct{id: id} when is_nil(id) ->
        conn
        |> put_status(:not_found)
        |> json(%{
          "message": "Address is outside the supported area or no precinct was found"
        })

      _ ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{
          "message": "Unable to lookup precinct"
        })
    end
  end
end
