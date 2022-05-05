defmodule SurfaceBulma.Box do
  @moduledoc """
  A general purpose component that can be re-used in other components such as the `Navbar` and `Dropdown`.
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
