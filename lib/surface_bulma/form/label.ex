defmodule SurfaceBulma.Form.Label do
  use SurfaceBulma.Component
  alias Surface.Components.Form.Label

  include(Label, except: [:class])

  prop class, :css_class, default: "label"
  slot default, arg: %{field: :any}
  data context_field, :any, from_context: {Surface.Components.Form.Field, :field}

  def render(assigns) do
    ~F"""
    <Label {...included_props(assigns, Label)} class={@class}>
      <#slot>{@text || Phoenix.Naming.humanize(@field || @context_field)}</#slot>
    </Label>
    """
  end
end
