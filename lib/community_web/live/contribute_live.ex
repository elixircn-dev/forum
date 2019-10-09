defmodule CommunityWeb.ContributeLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  @content :community
           |> Application.app_dir("priv/data/contribute.md")
           |> File.read!()

  def render(assigns) do
    Phoenix.View.render(PageView, "contribute.html", assigns)
  end

  def mount(_session, socket) do
    content =
      case @content |> Earmark.as_html() do
        {:ok, html, _} -> html
        {:error, _, message} -> "Markdown document parsing failed, reason:\n> #{message}"
      end

    users =
      1..45
      |> Enum.map(fn i ->
        %{id: i, name: "user-#{i}", face: "#{Enum.random(1..3)}.png"}
      end)

    {:ok, assign(socket, content: content, users: users)}
  end
end
