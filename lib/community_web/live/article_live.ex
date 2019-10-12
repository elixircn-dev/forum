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

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    id = to_i(params["id"] || "0")
    {:noreply, socket |> assign(id: id) |> fetch()}
  end

  def fetch(%Socket{assigns: %{id: id}} = socket) do
    socket |> assign(article: find(id))
  end

  defp find(_id) do
    html_content =
      case @content |> Earmark.as_html(@markdown_opts) do
        {:ok, html, _} -> html
        {:error, _, message} -> "Markdown document parsing failed, reason:\n #{message}"
      end

    article = %{
      title: "我是文章的标题！",
      content: html_content
    }

    article
  end
end
