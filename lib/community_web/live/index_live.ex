defmodule CommunityWeb.IndexLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  @categories [
    %{icon: "far fa-comments", color: "#4e2a8e", text: "Elixir 社区", to: "＃"},
    %{icon: "fas fa-book", color: "#8AD654", text: "技术文档", to: "＃"},
    %{icon: "fas fa-users", color: "#289EBF", text: "求职招聘", to: "＃"},
    %{icon: "fas fa-star", color: "#fee83c", text: "精华文章", to: "＃"}
  ]

  @node_groups [
    %{
      name: "Elixir",
      nodes: [
        %{id: 1, name: "常见问题"},
        %{id: 2, name: "版本变化"},
        %{id: 3, name: "部署"},
        %{id: 4, name: "测试"},
        %{id: 5, name: "性能调优"},
        %{id: 6, name: "重构"},
        %{id: 7, name: "开源"},
        %{id: 8, name: "贡献"},
        %{id: 9, name: "求职"}
      ]
    },
    %{
      name: "框架/工具",
      nodes: [
        %{id: 10, name: "Mix"},
        %{id: 11, name: "Phoenix"},
        %{id: 12, name: "Ecto"},
        %{id: 13, name: "Distillery"}
      ]
    },
    %{
      name: "概念",
      nodes: [
        %{id: 14, name: "NIF"},
        %{id: 15, name: "分布式"},
        %{id: 16, name: "ETS/DETS"},
        %{id: 17, name: "Mnesia"},
        %{id: 18, name: "热更"}
      ]
    }
  ]

  @cities [
    %{id: 1, name: "北京"},
    %{id: 2, name: "上海"},
    %{id: 3, name: "深圳"},
    %{id: 4, name: "广州"},
    %{id: 5, name: "杭州"},
    %{id: 6, name: "南京"}
  ]

  def render(assigns) do
    Phoenix.View.render(PageView, "index.html", assigns)
  end

  def mount(_attrs, socket) do
    {:ok, assign(socket, categories: @categories, node_groups: @node_groups, cities: @cities)}
  end

  def nodes, do: @node_groups |> Enum.map(fn group -> group.nodes end) |> List.flatten()

  def cities, do: @cities
end
