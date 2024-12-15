defmodule Aurbata.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :message, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
