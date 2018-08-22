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

alias Idvote.Repo
alias Idvote.Precinct

if Mix.env() == :dev or Mix.env() == :test do
  Repo.insert!(%Precinct{
    id: "f02b6b42-faa6-469d-a800-c7a68d962e05",
    county: "Ada",
    gid: 1,
    name: "Elementary School",
    address: "123 Potato WY",
    geometry: %Geo.Polygon{
      coordinates: [[{0, 0}, {0, -10}, {-10, -10}, {-10, 0}, {0, 0}]],
      srid: 4269
    },
    opening_time: ~T[08:00:00],
    closing_time: ~T[20:00:00],
    date: ~D[2018-11-06]
  })

  Repo.insert!(%Precinct{
    id: "cce481a8-26ef-41a5-8e17-062275fb5851",
    county: "Ada",
    gid: 2,
    name: "Fire House",
    address: "123 Gem RD",
    geometry: %Geo.Polygon{
      coordinates: [[{0, 0}, {-10, 0}, {-10, 10}, {0, 10}, {0, 0}]],
      srid: 4269
    },
    opening_time: ~T[08:00:00],
    closing_time: ~T[20:00:00],
    date: ~D[2018-11-06]
  })

  Repo.insert!(%Precinct{
    id: "1d97882e-358a-444e-b82d-2d79f6f09876",
    county: "Ada",
    gid: 3,
    name: "Library",
    address: "123 Bonaparte BLVD",
    geometry: %Geo.Polygon{
      coordinates: [[{0, 0}, {0, 10}, {10, 10}, {10, 0}, {0, 0}]],
      srid: 4269
    },
    opening_time: ~T[08:00:00],
    closing_time: ~T[20:00:00],
    date: ~D[2018-11-06]
  })

  Repo.insert!(%Precinct{
    id: "8ae1fdc8-a54c-44f5-a0d0-17bb9e9aa23c",
    county: "Ada",
    gid: 4,
    name: "High School",
    address: "123 Snake ST",
    geometry: %Geo.Polygon{
      coordinates: [[{0, 0}, {10, 0}, {10, -10}, {0, -10}, {0, 0}]],
      srid: 4269
    },
    opening_time: ~T[08:00:00],
    closing_time: ~T[20:00:00],
    date: ~D[2018-11-06]
  })
end
