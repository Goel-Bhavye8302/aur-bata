# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Aurbata.Repo.insert!(%Aurbata.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

posts_path = "priv/repo/seed/posts.json"

alias Aurbata.Posts

posts_path
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn attrs ->
  post = %{message: attrs["message"]}

  case Posts.create_post(post) do
    {:ok, _post} -> :ok
    {:error, _changeset} -> :error
  end
end)
