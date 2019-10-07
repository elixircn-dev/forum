defmodule CommunityWeb.LiveView do
  defmacro __using__(otps) do
    quote do
      use Phoenix.LiveView, unquote(otps)
      import CommunityWeb.LiveView
    end
  end

  defmacro conv_i_compatible(str, default \\ 0) do
    quote do
      try do
        unquote(str)
        |> String.to_integer()
      rescue
        _ -> unquote(default)
      end
    end
  end
end
