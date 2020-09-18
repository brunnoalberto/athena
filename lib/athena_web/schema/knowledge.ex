defmodule AthenaWeb.Schema.Knowledge do
  use Absinthe.Schema.Notation

  alias AthenaWeb.Resolvers

  object :knowledge do
    field :id, :id
    field :name, :string
    field :description, :string
  end

  object :knowledge_queries do

  end

  object :knowledge_mutations do
    @desc "Create Knowledge"
    field :create_knowledge, :knowledge do
      arg(:name, non_null(:string))
      arg(:description, non_null(:string))
      resolve &Resolvers.KnowledgeResolver.create_knowledge/3
    end
  end

end
