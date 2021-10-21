defmodule SurfaceBulma.Form.TextArea do
  @moduledoc """
  The text area component as defined here: https://bulma.io/documentation/form/textarea/
  """

  use SurfaceBulma.Component
  import SurfaceBulma.Form.InputWrapper, only: [has_error?: 1, has_change?: 1, render_common_text_input_fields: 1]

  alias Surface.Components.Form.{Field, TextArea, Label}
  
  include TextArea

  @doc "The string label of the field"
  prop label, :string, required: true

  @doc "Disable embedded font awesome icons"
  prop disable_icons, :boolean, default: false

  @doc "Placeholder value"
  prop placeholder, :string, default: nil

  @doc "Size of textarea in css sense"
  prop size, :string, values: ["small", "normal", "medium", "large"], default: "normal"

  def render(assigns) do
    ~F"""
      <Field class="field" name={@field}>
        <Label :if={@label} class="label">{@label}</Label>
        <div class={"control", "has-icons-right": !@disable_icons && (has_error?(assigns) || has_change?(assigns))}>
          <TextArea
          {...included_props(assigns)}
          class={[
            "textarea",
            "is-#{@size}",
            "is-danger": has_error?(assigns),
            "is-success": has_change?(assigns) && !has_error?(assigns),
            ] ++ (@class || [])}
          field={@field}
          opts={
            [placeholder: @placeholder,
            rows: @rows] 
            ++ @opts
            } />
          {render_common_text_input_fields(assigns)}
        </div>
      </Field>
    """
  end
end
