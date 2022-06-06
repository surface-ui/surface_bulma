defmodule SurfaceBulma.Footer do
  @moduledoc """
  A simple responsive footer which can include anything: lists, headings, columns, icons, buttons, etc
  """

  use Surface.Component

  @doc "Css classes to enhance the look of the footer"
  prop class, :css_class, default: []

  slot default

  def render(assigns) do
    ~F"""
      <footer class={"footer", @class}>
        <#slot />
      </footer>
    """
  end
end
