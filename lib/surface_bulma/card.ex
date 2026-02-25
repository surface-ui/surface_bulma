defmodule SurfaceBulma.Card do
  use Surface.Component

  @moduledoc """
  An all-around flexible and composable component.

  [Bulma Docs - Card](https://bulma.io/documentation/components/card/)
  """

  use SurfaceBulma.ClassProp

  @doc "Custom options forwarded to container element"
  prop attrs, :map, default: %{}

  @doc "Multi-purpose container for any other element"
  slot default, required: true

  @doc "A horizontal bar with a shadow"
  slot header

  @doc "A full-width container for a responsive image"
  slot image

  @doc "A horizontal list of controls"
  slot footer

  def render(assigns) do
    assigns = assign(assigns, :classes, classes(assigns, "card"))

    ~F"""
    <div class={@classes} {...@attrs}>
      {#if slot_assigned?(:header)}
        <#slot {@header} />
      {/if}
      <div :if={slot_assigned?(:image)} class="card-image">
        <#slot {@image} />
      </div>
      <div class="card-content">
        <#slot />
      </div>
      <footer :if={slot_assigned?(:footer)} class="card-footer">
        <#slot {@footer} />
      </footer>
    </div>
    """
  end
end
