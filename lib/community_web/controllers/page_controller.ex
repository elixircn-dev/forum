defmodule CommunityWeb.PageController do
  use CommunityWeb, :controller

  @categories [
    [icon: "far fa-comments", color: "#EB682B", text: "Elixir 社区", to: "＃"],
    [icon: "fas fa-book", color: "#54BF28", text: "技术文档", to: "＃"],
    [icon: "fas fa-users", color: "#289EBF", text: "求职招聘", to: "＃"],
    [icon: "fas fa-star", color: "#E8F11B", text: "精华文章", to: "＃"]
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

  def index(conn, _params) do
    conn
    |> assign(:categories, @categories)
    |> assign(:note_groups, @note_groups)
    |> render("index.html")
  end
end
