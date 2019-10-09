defmodule CommunityWeb.AboutLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  @content :community
           |> Application.app_dir("priv/data/about.md")
           |> File.read!()

  def render(assigns) do
    Phoenix.View.render(PageView, "about.html", assigns)
  end

  def mount(_session, socket) do
    content =
      case @content |> Earmark.as_html() do
        {:ok, html, _} -> html
        {:error, _, message} -> "Markdown document parsing failed, reason:\n> #{message}"
      end

    {:ok, assign(socket, content: content)}
  end
end
