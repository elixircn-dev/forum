defmodule CommunityWeb.PageView do
  use CommunityWeb, :view

  def activated_name(nodes, node_id) do
    nodes =
      nodes
      |> Enum.filter(fn n -> node_id == n.id end)

    if Enum.count(nodes) > 0 do
      hd(nodes).name
    else
      "选择话题"
    end
  end

  def grouping(list, size), do: CommunityWeb.LiveView.grouping(list, size)

  def remove_nil(list) when is_list(list), do: Enum.filter(list, &(!is_nil(&1)))
end
