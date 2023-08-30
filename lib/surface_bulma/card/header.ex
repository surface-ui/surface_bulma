defmodule SurfaceBulma.Card.Header do
  use Surface.Component, slot: "header"

  @moduledoc """
  A horizontal bar with a shadow
  """

  use SurfaceBulma.ClassProp

  @doc "A left-aligned bold text"
  slot title

  @doc "A container for an icon"
  slot icon

  def render(assigns) do
    ~F"""
    <header class={classes(assigns, "card-header")}>
      <#slot {@title} :if={slot_assigned?(:title)} />

      <span :if={slot_assigned?(:icon)} class="card-header-icon">
        <#slot {@icon} />
      </span>
    </header>
    """
  end
end
