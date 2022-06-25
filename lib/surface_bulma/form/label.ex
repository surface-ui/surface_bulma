defmodule SurfaceBulma.Form.Label do
  use SurfaceBulma.Component
  alias Surface.Components.Form.Label

  include(Label, except: [:class])

  prop class, :css_class, default: "label"
  slot default, args: [:field]

  def render(assigns) do
    ~F"""
      <Label {...included_props(assigns)} class={@class}>
        <Context get={Surface.Components.Form.Field, field: field}>
          <#slot>{@text || Phoenix.Naming.humanize(field || @field)}</#slot>
        </Context>
      </Label>
    """
  end
end
