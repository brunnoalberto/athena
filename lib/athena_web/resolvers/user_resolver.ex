defmodule AthenaWeb.Resolvers.UserResolver do
  alias Athena.Accounts

  def list_users(_parent, args, _resolution) do
    Absinthe.Relay.Connection.from_list(
      Accounts.list_users(), args
    )
  end
end
