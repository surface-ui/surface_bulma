defmodule SurfaceBulma.Form.UrlInput do
  @moduledoc """
  The text field component as defined here: https://bulma.io/documentation/form/input/
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.UrlInput

  include(UrlInput)

  def render(assigns) do
    assigns = assign(assigns, :input_classes, input_classes(assigns))

    ~F"""
    <SurfaceBulma.Form.InputWrapper
      :let={form: form}
      field={@field}
      expanded={@expanded}
      help_text={@help_text}
      disable_icons={@disable_icons}
      icon_left={@icon_left}
      icon_right={@icon_right}
      field_class={@field_class}
      has_addons
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <UrlInput
        {...included_props(assigns, UrlInput)}
        class={@input_classes}
        field={@field}
        form={@form || form}
        value={@value}
        opts={[
          placeholder: @placeholder,
          disabled: @disabled
        ] ++ @opts}
      />
      <:right_addon>{render_right_addon(assigns)}</:right_addon>
    </SurfaceBulma.Form.InputWrapper>
    """
  end
end
