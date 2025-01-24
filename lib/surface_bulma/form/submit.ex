defmodule SurfaceBulma.Form.Submit do
  @moduledoc """
  A submit button to use in a Form.
  """
  use SurfaceBulma.Component
  import SurfaceBulma, only: [classes: 2]

  alias SurfaceBulma.Form.InputWrapper
  alias SurfaceBulma.Button

  include(Button)
  slot default

  prop expanded, :boolean
  prop field_class, :css_class, default: []

  @doc false
  data props, :map

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :props, included_props(assigns, Button))

    ~F"""
    <InputWrapper field_class={@field_class}>
      <Button
        {...@props}
        class={classes(assigns,
          button: @class == [],
          "is-#{@color}": @color,
          "is-#{@size}": @size,
          "is-fullwidth": @expand,
          "is-outlined": @outlined,
          "is-rounded": @rounded,
          "is-hovered": @hovered,
          "is-focused": @focused,
          "is-active": @active,
          "is-loading": @loading,
          "is-selected": @selected,
          "is-link": @link,
          "is-static": @static
        )}
        opts={@opts}
      >
        <slot />
      </Button>
    </InputWrapper>
    """
  end
end
