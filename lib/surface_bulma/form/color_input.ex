defmodule SurfaceBulma.Form.ColorInput do
  @moduledoc """
  A text input of type "color", shares a lot of props with regular text input.
  """

  use SurfaceBulma.Form.InputBase
  import SurfaceBulma.Form.InputWrapper

  alias Surface.Components.Form.ColorInput
  include(ColorInput)

  def render(assigns) do
    props = included_props(assigns) 
    ~F"""
      <SurfaceBulma.Form.InputWrapper :let={form: form}
        label={@label}
        field={@field}
        expanded={@expanded}
        help_text={@help_text}
        disable_icons={@disable_icons}
        icon_left={@icon_left}
        icon_right={@icon_right}
        has_addons?={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <ColorInput
        {...props} 
        class={[
          "input",
          "is-danger": has_error?(assigns),
          "is-success": has_change?(assigns) && !has_error?(assigns),
          "is-static": @static
          ] ++ (@class || [])}
        field={@field}
        form={form || @form}
        value={@value}
        opts={
          [
            disabled: @disabled,
            readonly: @readonly,
          ] ++ @opts}/>
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </SurfaceBulma.Form.InputWrapper>
    """
  end
end
