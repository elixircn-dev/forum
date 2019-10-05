defmodule CommunityWeb.TimeLive do
  use Phoenix.LiveView, container: {:span, class: "timer"}

  defp time_now do
    Time.utc_now() |> Time.truncate(:second)
  end

  def render(assigns) do
    Phoenix.View.render(CommunityWeb.PageView, "time.html", assigns)
  end

  def mount(_attr, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :update)

    {:ok, assign(socket, time: time_now())}
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, :time, time_now())}
  end
end
