defmodule IdvoteWeb.WebController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct

  @date_format "%m/%d/%Y"
  @time_format "%I:%M %p"

  def find(conn, %{"address" => street_address}) do
    %Precinct{
      name: name,
      address: polling_place_address,
      opening_time: opening_time,
      closing_time: closing_time,
      geometry: precinct,
      date: date
    } = Precinct.find_by_address(street_address)

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
  end
end
