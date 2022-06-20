defmodule Poinx.ProjectsTest do
  use Poinx.DataCase

  alias Poinx.Projects

  describe "projects" do
    alias Poinx.Projects.Project

    import Poinx.ProjectsFixtures

    @invalid_attrs %{parent_id: nil, status: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{parent_id: 42, status: "some status", title: "some title"}

      assert {:ok, %Project{} = project} = Projects.create_project(valid_attrs)
      assert project.parent_id == 42
      assert project.status == "some status"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{parent_id: 43, status: "some updated status", title: "some updated title"}

      assert {:ok, %Project{} = project} = Projects.update_project(project, update_attrs)
      assert project.parent_id == 43
      assert project.status == "some updated status"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "stories" do
    alias Poinx.Projects.Story

    import Poinx.ProjectsFixtures

    @invalid_attrs %{description: nil, extra_info: nil, position: nil, real_score: nil, title: nil}

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Projects.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Projects.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      valid_attrs = %{description: "some description", extra_info: "some extra_info", position: 42, real_score: 42, title: "some title"}

      assert {:ok, %Story{} = story} = Projects.create_story(valid_attrs)
      assert story.description == "some description"
      assert story.extra_info == "some extra_info"
      assert story.position == 42
      assert story.real_score == 42
      assert story.title == "some title"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      update_attrs = %{description: "some updated description", extra_info: "some updated extra_info", position: 43, real_score: 43, title: "some updated title"}

      assert {:ok, %Story{} = story} = Projects.update_story(story, update_attrs)
      assert story.description == "some updated description"
      assert story.extra_info == "some updated extra_info"
      assert story.position == 43
      assert story.real_score == 43
      assert story.title == "some updated title"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_story(story, @invalid_attrs)
      assert story == Projects.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Projects.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Projects.change_story(story)
    end
  end
end
