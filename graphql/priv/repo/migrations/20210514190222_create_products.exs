defmodule Graphql.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
