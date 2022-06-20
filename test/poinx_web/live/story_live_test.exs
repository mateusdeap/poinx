defmodule PoinxWeb.StoryLiveTest do
  use PoinxWeb.ConnCase

  import Phoenix.LiveViewTest
  import Poinx.ProjectsFixtures

  @create_attrs %{description: "some description", extra_info: "some extra_info", position: 42, real_score: 42, title: "some title"}
  @update_attrs %{description: "some updated description", extra_info: "some updated extra_info", position: 43, real_score: 43, title: "some updated title"}
  @invalid_attrs %{description: nil, extra_info: nil, position: nil, real_score: nil, title: nil}

  defp create_story(_) do
    story = story_fixture()
    %{story: story}
  end

  describe "Index" do
    setup [:create_story]

    test "lists all stories", %{conn: conn, story: story} do
      {:ok, _index_live, html} = live(conn, Routes.story_index_path(conn, :index))

      assert html =~ "Listing Stories"
      assert html =~ story.description
    end

    test "saves new story", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.story_index_path(conn, :index))

      assert index_live |> element("a", "New Story") |> render_click() =~
               "New Story"

      assert_patch(index_live, Routes.story_index_path(conn, :new))

      assert index_live
             |> form("#story-form", story: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#story-form", story: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.story_index_path(conn, :index))

      assert html =~ "Story created successfully"
      assert html =~ "some description"
    end

    test "updates story in listing", %{conn: conn, story: story} do
      {:ok, index_live, _html} = live(conn, Routes.story_index_path(conn, :index))

      assert index_live |> element("#story-#{story.id} a", "Edit") |> render_click() =~
               "Edit Story"

      assert_patch(index_live, Routes.story_index_path(conn, :edit, story))

      assert index_live
             |> form("#story-form", story: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#story-form", story: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.story_index_path(conn, :index))

      assert html =~ "Story updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes story in listing", %{conn: conn, story: story} do
      {:ok, index_live, _html} = live(conn, Routes.story_index_path(conn, :index))

      assert index_live |> element("#story-#{story.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#story-#{story.id}")
    end
  end

  describe "Show" do
    setup [:create_story]

    test "displays story", %{conn: conn, story: story} do
      {:ok, _show_live, html} = live(conn, Routes.story_show_path(conn, :show, story))

      assert html =~ "Show Story"
      assert html =~ story.description
    end

    test "updates story within modal", %{conn: conn, story: story} do
      {:ok, show_live, _html} = live(conn, Routes.story_show_path(conn, :show, story))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Story"

      assert_patch(show_live, Routes.story_show_path(conn, :edit, story))

      assert show_live
             |> form("#story-form", story: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#story-form", story: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.story_show_path(conn, :show, story))

      assert html =~ "Story updated successfully"
      assert html =~ "some updated description"
    end
  end
end
