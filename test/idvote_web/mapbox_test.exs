defmodule IdvoteWeb.MapboxTest do
  use IdvoteWeb.ConnCase, async: true

  alias Idvote.Precinct

  setup do
    :ok
  end

  test "test" do
    {:ok, result} = Idvote.Mapbox.Geoencode.encode("500 S 8th St Boise Idaho")

    assert result.status === 200
  end


end