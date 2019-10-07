defmodule CommunityWeb.ArticleLive do
  alias CommunityWeb.{LiveView, PageView}

  use LiveView, container: {:div, class: "cm-page"}

  @content :community
           |> Application.app_dir("priv/data/article.md")
           |> File.read!()

  @markdown_opts %Earmark.Options{
    code_class_prefix: "lang-",
    smartypants: false
  }


  def render(assigns) do
    Phoenix.View.render(PageView, "article.html", assigns)
  end

  def mount(_attrs, socket) do
    html_content =
      case @content |> Earmark.as_html(@markdown_opts) do
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
