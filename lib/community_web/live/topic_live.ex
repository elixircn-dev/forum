defmodule CommunityWeb.TopicLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "topic.html", assigns)
  end

  def mount(attrs, socket) do
    {:ok, assign(socket, attrs)}
  end
end
