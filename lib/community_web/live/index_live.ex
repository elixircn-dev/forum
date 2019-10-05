defmodule CommunityWeb.IndexLive do
  use Phoenix.LiveView, container: {:div, class: "container cm-page"}

  @categories [
    [icon: "far fa-comments", color: "#8f2b9a", text: "Elixir 社区", to: "＃"],
    [icon: "fas fa-book", color: "#8AD654", text: "技术文档", to: "＃"],
    [icon: "fas fa-users", color: "#289EBF", text: "求职招聘", to: "＃"],
    [icon: "fas fa-star", color: "#fee83c", text: "精华文章", to: "＃"]
  ]

  @note_groups [
    [
      name: "Elixir",
      notes: [
        [name: "常见问题"],
        [name: "版本变化"],
        [name: "部署"],
        [name: "测试"],
        [name: "性能调优"],
        [name: "重构"],
        [name: "开源"],
        [name: "贡献"],
        [name: "求职"]
      ]
    ],
    [
      name: "框架/工具",
      notes: [
        [name: "Mix"],
        [name: "Phoenix"],
        [name: "Ecto"],
        [name: "Distillery"]
      ]
    ],
    [
      name: "概念",
      notes: [
        [name: "NIF"],
        [name: "分布式"],
        [name: "ETS/DETS"],
        [name: "Mnesia"],
        [name: "热更"]
      ]
    ]
  ]

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "index.html", assigns)
  end

  def mount(_attrs, socket) do
    {:ok, assign(socket, categories: @categories, note_groups: @note_groups)}
  end
end
