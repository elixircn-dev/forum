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

  @activities [
    %{
      type: :star,
      date: 1,
      title: "对比 LiveView 和前后端分离 SPA 方案差异",
      article_id: 10001
    },
    %{
      type: :vote,
      date: 1,
      title: "对比 LiveView 和前后端分离 SPA 方案差异",
      article_id: 10001
    },
    %{
      type: :reply,
      date: 1,
      title: "任何看待 Elixir China？",
      content: "这好像只是个 LiveView 演示吧？需要人手参与吗？",
      article_id: 10001
    },
    %{
      type: :topic,
      date: 2,
      title: "有群吗？我想加入",
      content: "页脚哪两个群是吗？有微信群吗？",
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

    happened =
      case params["happened"] do
        "activities" ->
          :activities

        "topics" ->
          :topics

        "qualities" ->
          :qualities

        _ ->
          :activities
      end

    {:noreply, socket |> assign(id: id, happened: happened) |> fetch()}
  end

  def fetch(%Socket{assigns: %{id: id, happened: happened}} = socket) do
    activities =
      case happened do
        :activities -> find_activities(id)
        :topics -> find_activities(id) |> Enum.filter(fn activity -> activity.type == :topic end)
        :qualities -> []
      end

    socket |> assign(user: find_user(id), activities: activities)
  end

  defp find_user(id) do
    @users |> Enum.at(id - 1)
  end

  defp find_activities(_user_id) do
    @activities
  end
end
