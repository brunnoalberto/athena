defmodule AthenaWeb.Resolvers.KnowledgeResolver do
  alias Athena.Topics

  def list_knowledge(_parent, args, _resolution) do
    Absinthe.Relay.Connection.from_list(
      Topics.list_knowledges(), args
    )
  end

  def create_knowledge(_parent, args, _resolution) do
    Topics.create_knowledge(args)
  end
end
