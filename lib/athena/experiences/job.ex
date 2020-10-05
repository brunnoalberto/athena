defmodule Athena.Experiences.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :job_title, :string
    field :company, :string
    field :job_description, :string
    field :start_date, :date
    field :end_date, :date

    timestamps()
  end

  @required_fields ~w(job_title company job_description start_date end_date)a
  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
