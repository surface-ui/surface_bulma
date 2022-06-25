defmodule SurfaceBulma.Box do
  @moduledoc """
  A simple container with a white background, some padding, and a box shadow.
  """

  use Surface.Component
  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~F"""
      <div class={"box", @class}>
        <#slot />
      </div>
    """
  end
end
