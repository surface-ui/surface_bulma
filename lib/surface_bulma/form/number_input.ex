defmodule SurfaceBulma.Form.NumberInput do
  @moduledoc """
  The number input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#number_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number
  """

  use Surface.Component
  use SurfaceBulma.Form.InputBase
  use SurfaceBulma.Form.InputAddonBase
  use SurfaceBulma.Form.InputIconBase

  alias Surface.Components.Form.{Field, NumberInput, Label}

  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  def render(assigns) do
    ~H"""
    <Field class={{
      "field",
      "has-addons": (slot_assigned?(:left_addon) || slot_assigned?(:right_addon)),
      "is-expanded": @expanded
      }}
      name={{@field}}>
      <Label :if={{!(slot_assigned?(:left_addon) || slot_assigned?(:right_addon)) && @label}} class="label">{{@label}}</Label>
      <div :if={{ slot_assigned?(:left_addon) }} class="control">
        <slot name="left_addon"/>
      </div>
      <div class={{
        "control",
        "has-icons-right": display_right_icon?(assigns),
        "has-icons-left": display_left_icon?(assigns),
        "is-expanded": @expanded
        }}>
        <NumberInput
        class={{[
          "input",
          "is-danger": has_error?(assigns),
          "is-success": has_change?(assigns) && !has_error?(assigns),
          "is-static": @static
          ] ++ @class}}
        field={{@field}}
        opts={{
          [
            disabled: @disabled,
            readonly: @readonly,
            max: @max,
            min: @min,
            step: @step,
            value: @value
          ] ++ @opts}}/>
        {{render_common_text_input_fields(assigns)}}
      </div>
      <div :if={{slot_assigned?(:right_addon)}} class="control" >
        <slot name="right_addon"/>
      </div>
      <span :if={{@help_text && !has_error?(assigns)}} class="help">{{@help_text}}</span>
    </Field>
    """
  end
end
