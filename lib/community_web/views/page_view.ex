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
end
