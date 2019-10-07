defmodule CommunityWeb.ArticleLive do
  use Phoenix.LiveView, container: {:div, class: "cm-page"}

  @content :community
           |> Application.app_dir("priv/data/article.md")
           |> File.read!()

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "article.html", assigns)
  end

  def mount(_attrs, socket) do
    html_content =
      case Earmark.as_html(@content) do
        {:ok, html, _} -> html
        {:error, _, message} -> "Markdown document parsing failed, reason:\n> #{message}"
      end

    article = %{
      title: "我是文章的标题！",
      content: html_content
    }

    {:ok, assign(socket, article: article)}
  end
end
