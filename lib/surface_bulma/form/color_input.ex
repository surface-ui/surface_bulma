defmodule SurfaceBulma.Form.ColorInput do
  @moduledoc """
  A text input of type "color", shares a lot of props with regular text input.
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.ColorInput
  include(ColorInput)

  def render(assigns) do
    props = included_props(assigns, ColorInput)
    input_classes = input_classes(assigns)

    ~F"""
    <InputWrapper
      :let={form: form}
      label={@label}
      field={@field}
      expanded={@expanded}
      help_text={@help_text}
      disable_icons={@disable_icons}
      icon_left={@icon_left}
      icon_right={@icon_right}
      has_addons={has_addons?(assigns)}
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <ColorInput
        {...props}
        class={input_classes}
        field={@field}
        form={@form || form}
        value={@value}
        opts={[
          disabled: @disabled,
          readonly: @readonly
        ] ++ @opts}
      />
      <:right_addon>{render_right_addon(assigns)}</:right_addon>
    </InputWrapper>
    """
  end
end
