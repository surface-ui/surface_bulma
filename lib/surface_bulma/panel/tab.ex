defmodule SurfaceBulma.Panel.Tab do
  @moduledoc """
  The tabs to display for a panel.
  N.B. the elements used in this slot will be wrapped with a `<a>` tag.
  Use the `click` prop to add custom events which handle when a user clicks a tab.
  """
  use SurfaceBulma.Component, slot: "tabs"

  @doc "The items that will be rendered in this tab"
  slot panel_tab_items, required: true

  def render(assigns) do
    ~F"""
    {#for item <- @panel_tab_items}
      <#slot {item} />
    {/for}
    """
  end
end
