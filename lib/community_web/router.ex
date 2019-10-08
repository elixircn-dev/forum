defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CommunityWeb do
    pipe_through :browser

    live "/", IndexLive
    live "/topics", TopicsLive
    live "/article/*path", ArticleLive
    live "/users/city/:city_id", CityLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", CommunityWeb do
  #   pipe_through :api
  # end
end
