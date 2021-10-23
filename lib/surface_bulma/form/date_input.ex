defmodule SurfaceBulma.Form.DateInput do
  @moduledoc """
  The date input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#date_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date
  """

  use SurfaceBulma.Form.InputBase
  import SurfaceBulma.Form.InputWrapper

  alias Surface.Components.Form.DateInput
  include(DateInput)

  @doc "Largest date allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Earliest date allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  def render(assigns) do
    props = included_props(assigns)

    ~F"""
      <SurfaceBulma.Form.InputWrapper :let={form: form}
        label={@label}
        expanded={@expanded}
        field={@field}
        help_text={@help_text}
        disable_icons={@disable_icons}
        icon_left={@icon_left}
        icon_right={@icon_right}
        has_addons={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <DateInput
        {...props} 
        class={[
          "input",
          "is-danger": has_error?(assigns),
          "is-success": has_change?(assigns) && !has_error?(assigns),
          "is-static": @static
          ] ++ (@class || [])}
        form={form || @form}
        field={@field}
        value={@value}
        opts={
          [
            disabled: @disabled,
            readonly: @readonly,
            max: @max,
            min: @min,
          ] ++ @opts}/>
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </SurfaceBulma.Form.InputWrapper>
    """
  end
end
