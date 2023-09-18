defmodule Demoatlant.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer
    field :repost_count, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :body, :likes_count, :repost_count])
    |> validate_required([:username, :body, :likes_count, :repost_count])
  end
end
