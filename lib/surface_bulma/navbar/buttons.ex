defmodule SurfaceBulma.Navbar.Buttons do
  use Surface.Component, slot: "buttons"

  slot default

  def render(assigns) do
    ~F"""
    <div class="buttons">
    {#for {_, index} <- Enum.with_index(@default)}
      <#slot name="default" index={index} />
    {/for}
    </div>
    """
  end
end
