defimpl Jason.Encoder, for: Geo.Polygon do
  def encode(value, opts) do
    %{coordinates: coordinates, srid: srid} = Map.take(value, [:srid,:coordinates])

    coordinates = Enum.map(coordinates, &Enum.map(&1, fn point -> Tuple.to_list(point) end))

    Jason.Encode.map(%{bbox: coordinates, srid: srid}, opts)
  end
end
