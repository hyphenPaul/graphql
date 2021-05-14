defmodule Graphql.Schema do
  use Absinthe.Schema

  alias Graphql.ProductResolver

  object :product do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)
  end

  query do
    @desc "Get all products"
    field :all_products, non_null(list_of(non_null(:product))) do
      resolve(&ProductResolver.all_products/3)
    end
  end

  mutation do
    @desc "Create a new product"
    field :create_product, :product do
      arg :title, non_null(:string)
      arg :description, non_null(:string)

      resolve &ProductResolver.create_product/3
    end
  end
end
