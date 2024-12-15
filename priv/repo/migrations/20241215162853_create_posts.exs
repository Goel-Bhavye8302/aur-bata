defmodule Aurbata.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :message, :string

      timestamps(type: :utc_datetime)
    end
  end
end
