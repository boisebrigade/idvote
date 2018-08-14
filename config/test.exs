use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :idvote, IdvoteWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :tesla, adapter: Tesla.Mock

# Configure your database
config :idvote, Idvote.Repo,
  types: Idvote.PostgresTypes,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
