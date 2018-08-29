defmodule Idvote.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema.Notation, :modern
  use Absinthe.Relay.Schema, :modern

  node interface do
    resolve_type(fn
      _, _ ->
        :polling_place
    end)
  end

  object :coordinate do
    field(:x, :float)
    field(:y, :float)
  end

  object :address do
    field(:suggestions, list_of(:string))
  end

  object :location do
    field(:srid, :integer)
    field(:coordinates, list_of(:coordinate))
  end

  node object(:polling_place) do
    field(:name, :string)
    field(:address, :string)
    field(:address_geoencoded, :location)

    field(:opening_time, :string)
    field(:closing_time, :string)
    field(:date, :string)

    field(:geometry, :string)
  end

  query do
    field :precinct, :polling_place do
      arg(:address, non_null(:string))
      resolve(&Idvote.Resolver.Precincts.find/3)
    end

    field :address, :address do
      arg(:address, non_null(:string))
      resolve(&Idvote.Resolver.Precincts.autocomplete/3)
    end

    node field do
      resolve(fn
        %{type: :polling_place, id: id}, _ ->
          Idvote.Resolver.Precincts.find(%{id: id})
      end)
    end
  end
end
