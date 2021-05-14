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

%Product{title: "Killer Boot", description: "This boot sure is killer"} |> Repo.insert!()
%Product{title: "Alright Gloves", description: "These gloves are sure shaped like hands"} |> Repo.insert!()
