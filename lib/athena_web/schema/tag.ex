defmodule AthenaWeb.Schema.Tag do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  object :tag do
    field :id, :id
    field :name, :string
  end
end
