defmodule Graphql.Skus.Sku do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skus" do
    field :title, :string

    belongs_to(:product, Graphql.Products.Product)

    timestamps()
  end

  @doc false
  def changeset(sku, attrs) do
    sku
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
