defmodule Graphql.Skus do
  @moduledoc """
  The Skus context.
  """

  import Ecto.Query, warn: false
  alias Graphql.Repo

  alias Graphql.Skus.Sku

  def data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  def query(queryable, %{ids: ids}) do
    from(table in queryable, where: table.id in ^ids)
  end

  def query(queryable, %{id: id}) do
    from(table in queryable, where: table.id == ^id)
  end

  def query(queryable, params) do
    queryable
  end

  @doc """
  Returns the list of skus.

  ## Examples

      iex> list_skus()
      [%Sku{}, ...]

  """
  def list_skus do
    Repo.all(Sku)
  end

  @doc """
  Gets a single sku.

  Raises `Ecto.NoResultsError` if the Sku does not exist.

  ## Examples

      iex> get_sku!(123)
      %Sku{}

      iex> get_sku!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sku!(id), do: Repo.get!(Sku, id)

  @doc """
  Creates a sku.

  ## Examples

      iex> create_sku(%{field: value})
      {:ok, %Sku{}}

      iex> create_sku(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sku(attrs \\ %{}) do
    %Sku{}
    |> Sku.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sku.

  ## Examples

      iex> update_sku(sku, %{field: new_value})
      {:ok, %Sku{}}

      iex> update_sku(sku, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sku(%Sku{} = sku, attrs) do
    sku
    |> Sku.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sku.

  ## Examples

      iex> delete_sku(sku)
      {:ok, %Sku{}}

      iex> delete_sku(sku)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sku(%Sku{} = sku) do
    Repo.delete(sku)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sku changes.

  ## Examples

      iex> change_sku(sku)
      %Ecto.Changeset{data: %Sku{}}

  """
  def change_sku(%Sku{} = sku, attrs \\ %{}) do
    Sku.changeset(sku, attrs)
  end
end
