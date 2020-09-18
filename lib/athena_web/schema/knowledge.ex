defmodule AthenaWeb.Schema.Knowledge do
  use Absinthe.Schema.Notation

  object :knowledge do
    field :id, :id
    field :name, :string
    field :description, :string
  end

  object :knowledge_queries do

  end

  object :knowledge_mutations do

  end

end
