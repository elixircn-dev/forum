defmodule CommunityWeb.TopicsLive do
  alias CommunityWeb.{LiveView, PageView, IndexLive}

  use LiveView, container: {:div, class: "cm-page"}

  @topics [
    [id: 0, name: "全部", to: "news"],
    [id: 10004, name: "讨论", to: "discussions"],
    [id: 10002, name: "聊天/灌水", to: "chat"],
    [id: 10003, name: "问题/帮助", to: "questions-help"]
  ]

  def render(assigns) do
    Phoenix.View.render(PageView, "topics.html", assigns)
  end

  def mount(%{category_id: category_id, node_id: node_id}, socket) do
    {:ok,
     assign(socket,
       topics: @topics,
       nodes: IndexLive.nodes(),
       category_id: category_id,
       node_id: node_id
     )}
  end

  def mount(session, socket) do
    category_id = session |> Map.get(:category_id, 0)
    node_id = session |> Map.get(:node_id, 0)

    mount(%{category_id: category_id, node_id: node_id}, socket)
  end

  def handle_params(attrs, _uri, socket) do
    category_id = attrs |> Map.get("category_id", "0") |> to_i
    node_id = attrs |> Map.get("node_id", "0") |> to_i

    {:noreply, socket |> assign(category_id: category_id, node_id: node_id)}
  end
end
