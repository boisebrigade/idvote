defmodule IdvoteWeb.Router do
  use IdvoteWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/api" do
    pipe_through(:api)

    post("/sms", IdvoteWeb.TwilioController, :sms)

    forward("/graphql", Absinthe.Plug, schema: Idvote.Schema)

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: Idvote.Schema,
      interface: :playground
    )
  end

  scope "/", IdvoteWeb do
    forward("/", StaticPlug)
  end
end
