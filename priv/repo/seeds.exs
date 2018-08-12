# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Idvote.Repo.insert!(%Idvote.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

if Mix.env == :dev do
  alias Ecto.Adapters.SQL

  querystring = File.read!("precincts.sql" |> Path.expand(__DIR__))

  SQL.query(Idvote.Repo, querystring , [])
end