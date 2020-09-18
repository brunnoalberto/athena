defmodule Athena.Topics.Knowledge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "knowledges" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @required_fields ~w(name description)a
  @doc false
  def changeset(knowledge, attrs) do
    knowledge
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
