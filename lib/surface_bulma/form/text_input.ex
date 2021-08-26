defmodule SurfaceBulma.Form.TextInput do
  @moduledoc """
  The text field component as defined here: https://bulma.io/documentation/form/input/
  """

  use Surface.Component
  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.{Field, TextInput, Label}

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop(maxlength, :integer)

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop(minlength, :integer)

  def render(assigns) do
    ~F"""
    <Field class={
      "field",
      "has-addons": (slot_assigned?(:left_addon) || slot_assigned?(:right_addon)),
      "is-expanded": @expanded
      }
      name={@field}>
      <Label :if={!(slot_assigned?(:left_addon) || slot_assigned?(:right_addon)) && @label} class="label">{@label}</Label>
      <div :if={slot_assigned?(:left_addon)} class="control">
        <#slot name="left_addon"/>
      </div>
      <div class={
        "control",
        "has-icons-right": display_right_icon?(assigns),
        "has-icons-left": display_left_icon?(assigns),
        "is-expanded": @expanded
        }>
        <TextInput
        class={[
          "input",
          "is-danger": has_error?(assigns),
          "is-success": has_change?(assigns) && !has_error?(assigns),
          "is-static": @static
          ] ++ @class}
        field={@field}
        value={@value}
        opts={
          [
            placeholder: @placeholder,
            disabled: @disabled,
            readonly: @readonly,
            maxlength: @maxlength,
            minlength: @minlength
          ] ++ @opts}/>
        {render_common_text_input_fields(assigns)}
      </div>
      <div :if={slot_assigned?(:right_addon)} class="control" >
        <#slot name="right_addon"/>
      </div>
      <span :if={@help_text && !has_error?(assigns)} class="help">{@help_text}</span>
    </Field>
    """
  end
end