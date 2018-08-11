defmodule IdvoteWeb.Router do
  use IdvoteWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", IdvoteWeb do
    pipe_through :api
  end
end
