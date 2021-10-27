defmodule SurfaceBulma.Form.NumberInput do
  @moduledoc """
  The number input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#number_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.NumberInput
  include(NumberInput)

  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  def render(assigns) do
    input_classes = input_classes(assigns)

    ~F"""
      <InputWrapper :let={form: form}
        field={@field}
        label={@label}
        expanded={@expanded}
        help_text={@help_text}
        disable_icons={@disable_icons}
        icon_left={@icon_left}
        icon_right={@icon_right}
        has_addons={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <NumberInput
        {...included_props(assigns)} 
        class={input_classes}
        field={@field}
        form={form || @form}
        value={@value}
        opts={
          [
            disabled: @disabled,
            readonly: @readonly,
            max: @max,
            min: @min,
            step: @step,
          ] ++ @opts}/>
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
    """
  end
end
