defmodule IdvoteWeb.PrecinctTest do
  use IdvoteWeb.ConnCase, async: true

  alias Idvote.Precinct

  test "given an a valid address we get a precinct with an address, name, date, opening time and closing time" do
    assert %Precinct{address: _, name: _, date: _, opening_time: _, closing_time: _} = Precinct.find_by_point(%Geo.Point{coordinates: {5, 5}, srid: 4269})
  end
end
