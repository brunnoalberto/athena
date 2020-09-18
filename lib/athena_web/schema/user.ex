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
    @desc "Create User"
    field :create_user, :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:role_id, non_null(:id))
      resolve &Resolvers.UserResolver.create_user/3
    end
  end

end
