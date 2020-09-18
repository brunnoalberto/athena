defmodule AthenaWeb.Resolvers.KnowledgeResolver do
  alias Athena.Topics

  def create_knowledge(_parent, args, _resolution) do
    Topics.create_knowledge(args)
  end
end
