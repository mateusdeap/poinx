defmodule Poinx.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias Poinx.Projects.Story

  schema "projects" do
    field :parent_id, :integer
    field :status, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :status, :parent_id])
    |> validate_required([:title])
  end
end
