defmodule PoinxWeb.ProjectLive.Show do
  use PoinxWeb, :live_view

  alias Poinx.Projects
  alias Poinx.Projects.Story

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
    socket
    |> assign(:page_title, page_title(socket.assigns.live_action))
    |> apply_action(socket.assigns.live_action, id)}
  end

  defp apply_action(socket, :new, id) do
    socket
    |> assign(:project, Projects.get_project!(id))
    |> assign(:story, %Story{})
  end

  defp apply_action(socket, _, id) do
    socket
    |> assign(:project, Projects.get_project!(id))
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
  defp page_title(:new), do: "New Story"
end
