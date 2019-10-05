defmodule CommunityWeb.TopicsLive do
  use Phoenix.LiveView, container: {:div, class: "container cm-page"}

  @topics [
    [name: "全部", to: "news"],
    [name: "聊天/灌水", to: "chat"],
    [name: "问题/帮助", to: "questions-help"],
    [name: "讨论", to: "discussions"]
  ]

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "topics.html", assigns)
  end

  def mount(_attrs, socket) do
    {:ok, assign(socket, topics: @topics)}
  end
end
