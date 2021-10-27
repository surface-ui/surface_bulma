defmodule SurfaceBulma.Form.RangeInput do
  @moduledoc """
  Range input is currently not implemented in Bulma.
  Needs custom css to display properly. This is a TODO item.

  The range input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#range_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.RangeInput
  include(RangeInput)

  def render(assigns) do
    props = included_props(assigns)

    ~F"""
      <InputWrapper :let={form: form}
        label={@label}
        field={@field}
        expanded={@expanded}
        help_text={@help_text}
        disable_icons={@disable_icons}
        icon_left={@icon_left}
        icon_right={@icon_right}
        has_addons={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <RangeInput
        {...props} 
        class={[
          "input",
          "slider",
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
            max: @max,
            min: @min,
          ] ++ @opts}/>
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
    """
  end
end
