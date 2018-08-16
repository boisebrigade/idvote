defmodule IdvoteWeb.TwilioController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct
  alias IdvoteWeb.Twiml

  @date_format "%m/%d/%Y"
  @time_format "%I:%M %p"

  def sms(conn, %{"Body" => street_address}) do
    %Precinct{
      name: name,
      address: polling_place_address,
      opening_time: opening_time,
      closing_time: closing_time,
      date: date
    } = Precinct.find_by_address(street_address)

    opening_time = Timex.format!(opening_time, @time_format, :strftime)
    closing_time = Timex.format!(closing_time, @time_format, :strftime)

    date = Timex.format!(date, @date_format, :strftime)

    response =
      "Your place it to vote is #{name} at #{polling_place_address}. It will be open from #{opening_time} to #{closing_time} on #{date}. Please take a valid Photo ID. More details found at https://idvote.org"

    conn
    |> encode(response)
  end

  defp encode(conn, response) do
    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, Twiml.sms(response))
  end
end
