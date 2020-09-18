defmodule Athena.Repo.Migrations.CreateKnowledges do
  use Ecto.Migration

  def change do
    create table(:knowledges) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
