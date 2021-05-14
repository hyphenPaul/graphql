defmodule Graphql.ProductResolver do
  alias Graphql.Products

  def all_products(_root, _args, _info) do
    {:ok, Products.list_products()}
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
