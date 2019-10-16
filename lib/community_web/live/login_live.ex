defmodule CommunityWeb.LoginLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  def render(assigns) do
    Phoenix.View.render(PageView, "login.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, socket}
  end
end
