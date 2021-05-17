defmodule Graphql.Schema do
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias Graphql.ProductResolver
  alias Graphql.Products
  alias Graphql.Skus

  object :product do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)

    field :skus, list_of(:sku) do
      arg :id, :id
      arg :ids, list_of(:id)

      resolve dataloader(Skus)
    end
  end

  object :sku do
    field :id, non_null(:id)
    field :title, non_null(:string)
  end

  query do
    @desc "Get all products"
    field :products, non_null(list_of(non_null(:product))) do
      resolve(&ProductResolver.all_products/3)
    end

    @desc "Get a single product"
    field :product, :product do
      arg :id, non_null(:id)
      resolve(&ProductResolver.find_product/3)
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

  # The context/1 function is a callback specified by the Absinthe.Schema behaviour that
  # gives the schema itself an opportunity to set some values in the context that it may need in order to run.
  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(Products, Products.data())
      |> Dataloader.add_source(Skus, Skus.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
