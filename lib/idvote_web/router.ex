defmodule IdvoteWeb.Router do
  use IdvoteWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IdvoteWeb do
    pipe_through :api

    post("/find", WebController, :find)
    post("/sms", TwilioController, :sms)
  end
end
