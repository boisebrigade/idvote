defmodule Idvote.Subscriber do
  alias Idvote.Precint


  alias Idvote.{Repo, Precinct}
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriber" do
    belongs_to(:precinct, Precinct)
    field(:email, :string)
    field(:phone_number, :string)
    timestamps()
  end

  @doc false
  def changeset(precinct, attrs) do
    precinct
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
