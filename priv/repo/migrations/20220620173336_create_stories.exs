defmodule Poinx.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :title, :string
      add :description, :text
      add :position, :integer
      add :real_score, :integer
      add :extra_info, :string
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:stories, [:project_id])
  end
end
