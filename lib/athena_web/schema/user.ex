defmodule AthenaWeb.Schema.User do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias AthenaWeb.Resolvers

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :role, :role, resolve: dataloader(Athena.Accounts)
  end

  connection node_type: :user

  object :user_queries do
    @desc "List Users"
    connection field :users, node_type: :user do
      resolve &Resolvers.UserResolver.list_users/3
    end
  end

  object :user_mutations do

  end

end
