defmodule SurfaceBulma.Card do
  use Surface.Component

  @moduledoc """
  An all-around flexible and composable component.

  [Bulma Docs - Card](https://bulma.io/documentation/components/card/)
  """

  @doc "Additional CSS classes"
  prop class, :css_class

  @doc "Custom options forwarded to container element"
  prop attrs, :map, default: %{}

  @doc "Multi-purpose container for any other element"
  slot(default, required: true)

  @doc "A horizontal bar with a shadow"
  slot(header)

  @doc "A full-width container for a responsive image"
  slot(image)

  @doc "A horizontal list of controls"
  slot(footer)

  def render(assigns) do
    ~F"""
    <div class={"card", @class} {...@attrs}>
      <div :if={slot_assigned?(:header)} class="card-header">
        <#slot {@header} />
      </div>
      <div :if={slot_assigned?(:image)} class="card-image">
        <#slot {@image} />
      </div>
      <div class="card-content">
        <#slot />
      </div>
      <div :if={slot_assigned?(:footer)} class="card-footer">
        <#slot {@footer} />
      </div>
    </div>
    """
  end
end
