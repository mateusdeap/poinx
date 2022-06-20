defmodule Poinx.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :status, :string
      add :parent_id, :integer

      timestamps()
    end
  end
end
