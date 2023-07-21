defmodule SurfaceBulma.Buttons do
  use Surface.Component, slot: "buttons"

  slot default

  def render(assigns) do
    ~F"""
    <div class="buttons">
      {#for item <- @default}
        <#slot {item} />
      {/for}
    </div>
    """
  end
end
