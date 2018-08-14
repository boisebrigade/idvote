defmodule IdvoteWeb.Router do
  use IdvoteWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/api", IdvoteWeb do
    pipe_through :api

    post("/find", WebController, :find)
    post("/sms", TwilioController, :sms)
  end

  scope "/", IdvoteWeb do
    forward "/", StaticPlug
  end
end
