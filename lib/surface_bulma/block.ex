defmodule SurfaceBulma.Block do
  @moduledoc """
  A simple spacer tool. It allows sibling HTML elements to have a consistent margin between them.
  """

  use Surface.Component
  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~F"""
      <div class={"block", @class}>
        <#slot />
      </div>
    """
  end
end
