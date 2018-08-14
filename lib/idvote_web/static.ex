defmodule IdvoteWeb.StaticPlug do
  @behaviour Plug
  import Plug.Conn

  def init(_), do: []

  def call(conn, _), do: send_file(conn, 200, "priv/static/index.html")
end
