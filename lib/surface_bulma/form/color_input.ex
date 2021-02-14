defmodule SurfaceBulma.Form.ColorInput do
  @moduledoc """
  A text input of type "color", shares a lot of props with regular text input.
  """

  use Surface.Component
  use SurfaceBulma.Form.InputBase
  use SurfaceBulma.Form.InputIconBase
  use SurfaceBulma.Form.InputAddonBase

  alias Surface.Components.Form.{Field, ColorInput, Label}

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
        "is-expanded": @expanded || (slot_assigned?(:left_addon) || slot_assigned?(:right_addon))
        }}>
        <ColorInput
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
