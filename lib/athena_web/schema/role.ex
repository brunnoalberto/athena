defmodule AthenaWeb.Schema.Role do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :role do
    field :id, :id
    field :type, :string
    field :description, :string
    field :user, :user, resolve: dataloader(Athena.Accounts)
  end

  object :role_queries do

  end

  object :role_mutations do

  end

end
