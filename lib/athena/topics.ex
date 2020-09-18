defmodule Athena.Topics do
  @moduledoc """
  The Topics context.
  """

  import Ecto.Query, warn: false
  alias Athena.Repo

  alias Athena.Topics.Knowledge

  @doc """
  Returns the list of knowledges.

  ## Examples

      iex> list_knowledges()
      [%Knowledge{}, ...]

  """
  def list_knowledges do
    Repo.all(Knowledge)
  end

  @doc """
  Gets a single knowledge.

  Raises `Ecto.NoResultsError` if the Knowledge does not exist.

  ## Examples

      iex> get_knowledge!(123)
      %Knowledge{}

      iex> get_knowledge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_knowledge!(id), do: Repo.get!(Knowledge, id)

  @doc """
  Creates a knowledge.

  ## Examples

      iex> create_knowledge(%{field: value})
      {:ok, %Knowledge{}}

      iex> create_knowledge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_knowledge(attrs \\ %{}) do
    %Knowledge{}
    |> Knowledge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a knowledge.

  ## Examples

      iex> update_knowledge(knowledge, %{field: new_value})
      {:ok, %Knowledge{}}

      iex> update_knowledge(knowledge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_knowledge(%Knowledge{} = knowledge, attrs) do
    knowledge
    |> Knowledge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a knowledge.

  ## Examples

      iex> delete_knowledge(knowledge)
      {:ok, %Knowledge{}}

      iex> delete_knowledge(knowledge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_knowledge(%Knowledge{} = knowledge) do
    Repo.delete(knowledge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking knowledge changes.

  ## Examples

      iex> change_knowledge(knowledge)
      %Ecto.Changeset{data: %Knowledge{}}

  """
  def change_knowledge(%Knowledge{} = knowledge, attrs \\ %{}) do
    Knowledge.changeset(knowledge, attrs)
  end

  def data(), do: Dataloader.Ecto.new(Athena.Repo, query: &query/2)

  def query(queryable, _params), do: queryable
end
