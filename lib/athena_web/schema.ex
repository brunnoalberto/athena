defmodule AthenaWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :classic

  import_types(Absinthe.Type.Custom)

  import_types(AthenaWeb.Schema.Role)
  import_types(AthenaWeb.Schema.User)
  import_types(AthenaWeb.Schema.Tag)

  query do
    import_fields :role_queries
    import_fields :user_queries
  end

  mutation do
    import_fields :role_mutations
    import_fields :user_mutations
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Athena.Accounts, Athena.Accounts.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
