defmodule Poinx.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Poinx.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        parent_id: 42,
        status: "some status",
        title: "some title"
      })
      |> Poinx.Projects.create_project()

    project
  end

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        description: "some description",
        extra_info: "some extra_info",
        position: 42,
        real_score: 42,
        title: "some title"
      })
      |> Poinx.Projects.create_story()

    story
  end
end
