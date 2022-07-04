defmodule Poinx.Projects.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :description, :string
    field :extra_info, :string
    field :position, :integer
    field :real_score, :integer
    field :title, :string
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :description, :position, :real_score, :extra_info, :project_id])
    |> validate_required([:title, :description, :project_id])
  end
end
