defmodule Athena.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :type, :string
      add :description, :string

      timestamps()
    end

  end
end
