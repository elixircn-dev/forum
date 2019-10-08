defmodule CommunityWeb.CityLive do
  alias CommunityWeb.{LiveView, PageView, IndexLive}

  use LiveView, container: {:div, class: "cm-page"}

  def render(assigns) do
    Phoenix.View.render(PageView, "city.html", assigns)
  end

  def mount(_session, socket) do
    id = 1
    cities = IndexLive.cities()

    cities =
      cities
      |> Enum.filter(fn city -> city.id == id end)

    city =
      if cities |> Enum.count() > 0 do
        cities |> hd
      else
        nil
      end

    users =
      1..45
      |> Enum.map(fn i ->
        %{id: i, name: "user-#{i}", face: "#{Enum.random(1..3)}.png"}
      end)

    {:ok, assign(socket, city: city, users: users)}
  end
end
