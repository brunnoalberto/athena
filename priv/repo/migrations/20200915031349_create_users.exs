defmodule Athena.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :role_id, references(:roles)
      add :hash_password, :string

      timestamps()
    end
  end
end
