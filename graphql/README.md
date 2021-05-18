# Graphql


## Schema File

A file declaring how to interface with GraphQL. There are 3 primary declarations:

- object
- query
- mutation

### Object
The model for a requested object.

#### Example

```
object :product do
  field :id, non_null(:id)
  field :title, non_null(:string)
  field :description, non_null(:string)
end
```

### Query
Creates a GraphQL query interface. Your query declares things like the name of the query, possible arguments to the query, and how to resolve the query within your app. Queries encapsulate your reads.

#### Example

```
query do
  @desc "Get all products"
    field :all_products, non_null(list_of(non_null(:product))) do
    resolve(&ProductResolver.all_products/3)
  end
end
```

### Mutation
Mutations handle any mutations to your data, which is any inserts or updates to your database. They are similar to queries: they handle arguments and how to resolve the request.

#### Example

```
mutation do
@desc "Create a new product"
  field :create_product, :product do
    arg :title, non_null(:string)
    arg :description, non_null(:string)

    resolve &ProductResolver.create_product/3
  end
end
```

----------------------------------------------------------------------------------------------------

## HTTP Examples:

### GET

```
curl --location -g --request GET 'http://localhost:4002/graphql?query=query+{products{id+title+description}}'
```

### POST

```
curl --location --request POST 'http://localhost:4002/graphql' \
--header 'Content-Type: application/json' \
--data-raw '{"query":"{\n  products {\n    id\n    title\n    description\n  }\n}","variables":{}}'
```

----------------------------------------------------------------------------------------------------

## Resources

Official GraphQL Docs - https://graphql.org/
Absinthe Tutorial - https://www.howtographql.com/graphql-elixir/1-getting-started/
Absinthe Documentation - https://hexdocs.pm/absinthe/1.4.3/overview.html
GraphQL Clients - https://github.com/uesteibar/neuron | https://github.com/annkissam/common_graphql_client

----------------------------------------------------------------------------------------------------

## Analysis

- Most planning and development would happen on the schema layer setting up objects, queries, and mutations
- Need to create a standard for our ecto query structure, the dataloader creates boundaries that aren't all that bad
- There's not much room to implement this along side business rules - this feels like a data layer and only a data layer from a service perspective

----------------------------------------------------------------------------------------------------

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
