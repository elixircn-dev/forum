defmodule CommunityWeb.LiveView do
  defmacro __using__(otps) do
    quote do
      use Phoenix.LiveView, unquote(otps)
      alias Phoenix.LiveView.Socket
      import CommunityWeb.LiveView
    end
  end

  defmacro to_i(str, default \\ 0) do
    quote do
      try do
        unquote(str)
        |> String.to_integer()
      rescue
        _ -> unquote(default)
      end
    end
  end

  def grouping(list, size) when is_list(list) and is_integer(size) do
    list
    |> Enum.with_index()
    |> Enum.filter(fn {_, i} ->
      i == 0 || rem(i, size) == 0
    end)
    |> Enum.map(fn {_, i} ->
      range = 0..(size - 1)

      range
      |> Enum.map(fn n ->
        Enum.at(list, i + n)
      end)
    end)
  end
end
