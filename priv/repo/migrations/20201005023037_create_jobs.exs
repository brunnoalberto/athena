defmodule Athena.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :company, :string
      add :job_title, :string
      add :job_description, :string
      add :start_date, :date
      add :end_date, :date

      timestamps()
    end

  end
end
