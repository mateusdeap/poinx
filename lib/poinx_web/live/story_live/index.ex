defmodule PoinxWeb.StoryLive.Index do
  use PoinxWeb, :live_view

  alias Poinx.Projects
  alias Poinx.Projects.Story

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :stories, list_stories())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Story")
    |> assign(:story, Projects.get_story!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:story, %Story{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Stories")
    |> assign(:story, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    story = Projects.get_story!(id)
    {:ok, _} = Projects.delete_story(story)

    {:noreply, assign(socket, :stories, list_stories())}
  end

  defp list_stories do
    Projects.list_stories()
  end
end
