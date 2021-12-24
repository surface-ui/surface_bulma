defmodule SurfaceBulma.Card.Image do
  use Surface.Component

  @moduledoc """
  A fullwidth container for a responsive image
  """

  @doc "Multi-purpose container for any other element"
  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div class="card">
      <div class="card-image">
        <#slot />
      </div>
    </div>
    """
  end
end
