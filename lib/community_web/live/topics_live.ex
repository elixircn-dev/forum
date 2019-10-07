defmodule CommunityWeb.TopicsLive do
  use Phoenix.LiveView, container: {:div, class: "cm-page"}

  @topics [
    [id: 0, name: "全部", to: "news"],
    [id: 10002, name: "聊天/灌水", to: "chat"],
    [id: 10003, name: "问题/帮助", to: "questions-help"],
    [id: 10004, name: "讨论", to: "discussions"]
  ]

  @nodes [
    %{id: 1, name: "Phoenix"},
    %{id: 2, name: "Ecto"},
    %{id: 3, name: "Mix"},
    %{id: 4, name: "Plug"},
    %{id: 5, name: "Erlang/BEAM"}
  ]

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "topics.html", assigns)
  end

  def mount(%{category_id: category_id, node_id: node_id}, socket) do
    {:ok,
     assign(socket,
       topics: @topics,
       nodes: @nodes,
       category_id: category_id,
       node_id: node_id
     )}
  end

  def mount(attrs, socket) do
    category_id = attrs |> Map.get(:category_id, 0)
    node_id = attrs |> Map.get(:node_id, 0)

    mount(%{category_id: category_id, node_id: node_id}, socket)
  end

  def handle_params(attrs, _uri, socket) do
    category_id = attrs |> Map.get("category_id", "0")
    node_id = attrs |> Map.get("node_id", "0")

    category_id =
      try do
        category_id |> String.to_integer()
      rescue
        _ -> 0
      end

    node_id =
      try do
        node_id |> String.to_integer()
      rescue
        _ -> 0
      end

    {:noreply, socket |> assign(category_id: category_id, node_id: node_id)}
  end
end
