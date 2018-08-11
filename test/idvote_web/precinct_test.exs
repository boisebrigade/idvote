defmodule IdvoteWeb.PrecinctTest do
  use IdvoteWeb.ConnCase, async: true

  alias Idvote.Precinct

  setup do
    :ok
  end

  test "test" do
    assert Precinct.find(%Geo.Point{coordinates: {43, -116}, srid: }) == %Precinct{}
  end

end