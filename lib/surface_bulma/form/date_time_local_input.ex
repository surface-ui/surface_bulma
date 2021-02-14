defmodule SurfaceBulma.Form.DateTimeLocalInput do
  @moduledoc """
  The datetime standardized input
  """

  use Surface.Component
  use SurfaceBulma.Form.InputBase
  use SurfaceBulma.Form.InputIconBase
  use SurfaceBulma.Form.InputAddonBase

  alias Surface.Components.Form.{Field, DateTimeLocalInput, Label}

  @doc "Largest datetime allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Earliest datetime allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc """
  For datetime-local inputs, the value of step is given in seconds,
  with a scaling factor of 1000 (since the underlying numeric value is in milliseconds).
  The default value of step is 60, indicating 60 seconds (or 1 minute, or 60,000 milliseconds).
  """

  prop step, :integer, default: 60

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
        <DateTimeLocalInput
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
