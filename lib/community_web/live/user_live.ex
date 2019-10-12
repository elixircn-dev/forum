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

  def render(assigns) do
    Phoenix.View.render(PageView, "user.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    id = params |> Map.get("id", "0") |> to_i

    user = @users |> Enum.at(id - 1)

    {:noreply, socket |> assign(user: user)}
  end
end
