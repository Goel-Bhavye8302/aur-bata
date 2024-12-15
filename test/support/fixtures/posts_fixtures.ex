defmodule Aurbata.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aurbata.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        message: "some message"
      })
      |> Aurbata.Posts.create_post()

    post
  end
end
