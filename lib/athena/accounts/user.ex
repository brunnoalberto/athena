defmodule Athena.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :hash_password, :string

    belongs_to :role, Athena.Accounts.Role

    timestamps()
  end

  @required_fields ~w(name email role_id password)a
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> encrypt_password()
  end

  defp encrypt_password(user) do
    put_change(user, :hash_password, Bcrypt.hash_pwd_salt(get_field(user, :password)))
  end
end
