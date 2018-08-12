defmodule IdvoteWeb.WebControllerTest do
  use IdvoteWeb.ConnCase, async: true

  @dummy_address "500 S 8th St, Boise, Idaho 83702"

  setup do
    :ok
  end

  test "you can send an address and recieve a response", %{conn: conn} do
    conn = post(conn, "/find", %{"Address" => @dummy_address})

    assert conn.status === 200
    assert Map.keys(Poison.decode!(conn.resp_body)) === ["Address", "Time"]
  end
end
