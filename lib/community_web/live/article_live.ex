defmodule CommunityWeb.ArticleLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "article.html", assigns)
  end

  def mount(attrs, socket) do
    {:ok, assign(socket, attrs)}
  end
end
