defmodule IdvoteWeb.TwilioController do
  use IdvoteWeb, :controller

  alias Idvote.Precinct
  alias IdvoteWeb.Twiml

  @date_format "%m/%d/%Y"
  @time_format "%I:%M %p"

  @query """
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

  def sms(conn, %{"Body" => street_address}) do
    case Absinthe.run(@query, Idvote.Schema, variables: %{"address" => street_address}) do
      {:ok,
       %{
         data: %{
           "precinct" => %{
             "name" => name,
             "address" => address,
             "openingTime" => opening_time,
             "closingTime" => closing_time,
             "date" => date
           }
         }
       }} ->
        response =
          "Your place it to vote is #{name} at #{address}. It will be open from
#{opening_time} to #{closing_time} on #{date}. Please take a valid Photo ID. More details found at https://idvote.org"

        conn
        |> encode(response)

      _ ->
        conn
        |> send_resp(200, "")
    end
  end

  defp encode(conn, response) do
    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, Twiml.sms(response))
  end
end
