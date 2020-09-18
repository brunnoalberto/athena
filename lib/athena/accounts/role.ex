defmodule Athena.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :type, :string
    field :description, :string

    has_many :user, Athena.Accounts.User

    timestamps()
  end

  @required_fields ~w(type string)a
  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
