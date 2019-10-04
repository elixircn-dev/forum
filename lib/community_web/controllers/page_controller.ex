defmodule CommunityWeb.PageController do
  use CommunityWeb, :controller

  @categories [
    [icon: "far fa-comments", color: "#EB682B", text: "Elixir 社区", to: "＃"],
    [icon: "fas fa-book", color: "#54BF28", text: "技术文档", to: "＃"],
    [icon: "fas fa-users", color: "#289EBF", text: "求职招聘", to: "＃"],
    [icon: "fas fa-star", color: "#E8F11B", text: "精华文章", to: "＃"]
  ]

  @articles [
    [
      face: "1.png",
      title: "Rails 默认 Session 的存储方式：CookieStore",
      author: "elbrujohalcon",
      reply_author: "daareiza",
      reply_at: 10,
      reply_num: 27
    ],
    [
      face: "1.png",
      title: "[深度学习] 开源项目 RecruitBot，自动生成 Ruby China 招聘帖 (基于 TensorFlow)",
      author: "zacky1972",
      reply_author: "AstonJ",
      reply_at: 5,
      reply_num: 4
    ],
    [
      face: "2.png",
      title: "[翻译] 关于 Ruby 解释器：一些你需要知道的",
      author: "Xiaoming",
      reply_author: "lee",
      reply_at: 7,
      reply_num: 32
    ],
    [
      face: "3.png",
      title: "在 Rails 项目中使用 Docker 和 GitLab CI 高效构建镜像 (第一部分)",
      author: "Jack",
      reply_author: "lee",
      reply_at: 10,
      reply_num: 29
    ],
    [
      face: "1.png",
      title: "使用 associationist 玩转 Rails 虚拟关联",
      author: "渣渣辉",
      reply_author: "Jack",
      reply_at: 1,
      reply_num: 27
    ],
    [
      face: "3.png",
      title: "Ruby 中的闭包-代码块",
      author: "匿名用户",
      reply_author: "无名",
      reply_at: 5,
      reply_num: 15
    ],
    [
      face: "1.png",
      title: "RubyConf China 2019 录像 [更新完毕]",
      author: "JoJo",
      reply_author: "二乔",
      reply_at: 5,
      reply_num: 9
    ],
    [
      face: "3.png",
      title: "创业团队怎么做数据？ —— 一套适合创业团队的数据平台解决方案",
      author: "Jack",
      reply_author: "JJ lee",
      reply_at: 3,
      reply_num: 21
    ],
    [
      face: "2.png",
      title: "更快的 Rails：如何检查记录是否存在, 你是否还在使用.present?",
      author: "Jack",
      reply_author: "JJ lee",
      reply_at: 4,
      reply_num: 19
    ],
    [
      face: "1.png",
      title: "解决 GraphQL 与 ActiveRecord 嵌套 N + 1 SQL 问题",
      author: "Jack",
      reply_author: "JJ lee",
      reply_at: 5,
      reply_num: 45
    ],
    [
      face: "3.png",
      title: "人生第一个过 5K Star 的 项目 x-spreadsheet (类似 excel) 感谢各位大佬的支持",
      author: "Jack",
      reply_author: "JJ lee",
      reply_at: 3,
      reply_num: 11
    ]
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
    articles =
      @articles
      |> Enum.with_index()
      |> Enum.filter(fn {_, i} ->
        i == 0 || rem(i, 2) == 0
      end)
      |> Enum.map(fn {_, i} ->
        a1 = @articles |> Enum.at(i)
        a2 = @articles |> Enum.at(i + 1)
        [a1, a2]
      end)

    conn
    |> assign(:categories, @categories)
    |> assign(:articles, articles)
    |> assign(:note_groups, @note_groups)
    |> render("index.html")
  end
end
