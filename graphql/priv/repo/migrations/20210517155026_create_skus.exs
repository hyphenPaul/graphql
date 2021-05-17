defmodule Graphql.Repo.Migrations.CreateSkus do
  use Ecto.Migration

  def change do
    create table(:skus) do
      add :title, :string
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:skus, [:product_id])
  end
end
