defmodule SurfaceBulma.Card.Header.Title do
  use Surface.Component, slot: "title"

  @moduledoc """
  The header title
  """

  use SurfaceBulma.ClassProp
  slot default

  def render(assigns) do
    ~F"""
    <p class={classes(assigns, "card-header-title")}>
      <#slot />
    </p>
    """
  end
end
