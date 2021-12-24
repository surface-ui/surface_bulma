defmodule SurfaceBulma.Card.Header do
  use Surface.Component

  @moduledoc """
  A horizontal bar with a shadow
  """

  @doc "A left-aligned bold text"
  slot(title)

  @doc "A container for an icon"
  slot(icon)

  def render(assigns) do
    ~F"""
    <header class="card-header">
      <p :if={slot_assigned?(:title)} class="card-header-title">
        <#slot name="title" />
      </p>

      <span :if={slot_assigned?(:icon)} class="card-header-icon">
        <#slot name="icon" />
      </span>
    </header>
    """
  end
end
