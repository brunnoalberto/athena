defmodule AthenaWeb.Schema.Knowledge do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :classic

  alias AthenaWeb.Resolvers

  object :knowledge do
    field :id, :id
    field :name, :string
    field :description, :string
  end

  connection node_type: :knowledge

  object :knowledge_queries do
    @desc "List Knowledge"
    connection field :knowledges, node_type: :knowledge do
      resolve &Resolvers.KnowledgeResolver.list_knowledge/3
    end

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
