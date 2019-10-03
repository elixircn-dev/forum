defmodule CommunityWeb.PageController do
  use CommunityWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
