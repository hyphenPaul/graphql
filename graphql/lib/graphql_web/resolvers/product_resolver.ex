defmodule Graphql.ProductResolver do
  alias Graphql.Products

  def all_products(_root, _args, _info) do
    {:ok, Products.list_products()}
  end

  def find_product(_root, %{id: id}, _resolution) do
    case Products.get_product(id) do
      nil ->
        {:error, "Product ID #{id} not found"}

      product ->
        {:ok, product}
    end
  end

  def create_product(_root, args, _info) do
    case Products.create_product(args) do
      {:ok, product} ->
        {:ok, product}

      _error ->
        {:error, "could not create product"}
    end
  end
end
