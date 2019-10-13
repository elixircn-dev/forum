defmodule CommunityWeb.UserLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  @users [
    %{
      username: "user-1",
      nickname: "用户1",
      face: "0.jpg",
      industry: "互联网",
      company: "百度",
      position: "CEO",
      location: "北京"
    },
    %{
      username: "user-2",
      nickname: "用户2",
      face: "0.jpg",
      industry: "互联网",
      company: "腾讯",
      position: "CEO",
      location: "深圳"
    },
    %{
      username: "user-3",
      nickname: "用户3",
      face: "0.jpg",
      industry: "互联网",
      company: "锤子科技",
      position: "CEO",
      location: "杭州"
    }
  ]

  @recently_activities [
    %{
      type: :reply,
      date: 1,
      title: "任何看待 Elixir China？",
      content: "这好像只是个 LiveView 演示吧？需要人手参与吗？",
      article_id: 10001
    },
    %{
      type: :reply,
      date: 1,
      title: "有群吗？我想加入",
      content: "有的，在页脚有两个，都有验证问题。",
      article_id: 10001
    }
  ]

  def render(assigns) do
    Phoenix.View.render(PageView, "user.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    id = to_i(params["id"] || "0")

    {:noreply, socket |> assign(id: id) |> fetch()}
  end

  def fetch(%Socket{assigns: %{id: id}} = socket) do
    socket |> assign(user: find_user(id), activities: find_activities(id))
  end

  defp find_user(id) do
    @users |> Enum.at(id - 1)
  end

  defp find_activities(_user_id) do
    @recently_activities
  end
end
