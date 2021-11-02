defmodule SurfaceBulma.Navbar.Start do
  use Surface.Component, slot: "nav_start"
  slot items

  def render(assigns) do
    ~F"""
    {#for {_, index} <- Enum.with_index(@items)}
      <#slot name="items" index={index} />
    {/for}
    """
  end
end
