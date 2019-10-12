defmodule CommunityWeb.CityLive do
  alias CommunityWeb.{LiveView, PageView, IndexLive}

  use LiveView, container: {:div, class: "cm-page"}

  def render(assigns) do
    Phoenix.View.render(PageView, "city.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    id = to_i(params["id"] || "0")
    {:noreply, socket |> assign(id: id) |> fetch}
  end

  def fetch(%Socket{assigns: %{id: id}} = socket) do
    socket |> assign(users: find_users(id), city: find_city(id))
  end

  defp find_users(_id) do
    1..45
    |> Enum.map(fn i ->
      %{id: i, name: "user-#{i}", face: "#{Enum.random(1..3)}.png"}
    end)
  end

  defp find_city(id) do
    cities = IndexLive.cities()

    cities
    |> Enum.filter(fn city -> city.id == id end)
    |> hd
  end
end
