defmodule SurfaceBulma.Panel.Tab do
  @moduledoc """
  The tabs to display for a panel. 
  N.B. the elements used in this slot will be wrapped with a `<a>` tag.
  Use the `click` prop to add custom events which handle when a user clicks a tab.
  """
  use Surface.Component, slot: "tabs"

  @doc """
  The title of this tab item
  """
  prop title, :string, required: true

  @doc """
  Specifies whether this tab is active or not
  """
  prop is_active, :boolean

  @doc """
  The event that will be bound to the tab item when it is clicked
  """
  prop click, :event

  @doc "Whether or not this tab is visible or not"
  prop visible, :boolean, default: true

  @doc "An icon that will be displayed next to the tab title"
  prop icon, :string

  @doc "The items that will be rendered in this tab"
  slot panel_tab_items, required: true

  def render(assigns) do
    ~F"""
    {#for {_, index} <- Enum.with_index(@panel_tab_items)}
      <#slot name="panel_tab_items" index={index} />
    {/for}
    """
  end
end
