# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Graphql.Repo.insert!(%Graphql.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Graphql.Repo
alias Graphql.Products.Product
alias Graphql.Skus.Sku

Repo.query("TRUNCATE products CASCADE")

p1 = %Product{title: "Killer Boot", description: "This boot sure is killer"} |> Repo.insert!()
p2 = %Product{title: "Alright Gloves", description: "These gloves are sure shaped like hands"} |> Repo.insert!()

%Sku{title: "Leather Boot Size 9", product_id: p1.id} |> Repo.insert!()
%Sku{title: "Leather Boot Size 8", product_id: p1.id} |> Repo.insert!()
%Sku{title: "Leather Boot Size 7", product_id: p1.id} |> Repo.insert!()
%Sku{title: "Black Gloves", product_id: p2.id} |> Repo.insert!()
%Sku{title: "Orange Gloves", product_id: p2.id} |> Repo.insert!()
