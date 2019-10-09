defmodule CommunityWeb.UserLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  def render(assigns) do
    Phoenix.View.render(PageView, "user.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, [])}
  end
end
