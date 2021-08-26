defmodule SurfaceBulma.Form.TextArea do
  @moduledoc """
  The text area component as defined here: https://bulma.io/documentation/form/textarea/
  """

  use SurfaceBulma.Component
  import SurfaceBulma.Form, only: [field_has_error?: 2, field_has_change?: 2]

  alias Surface.Components.Form.{Field, TextArea, ErrorTag, Label}
  alias SurfaceBulma.Icon.FontAwesome, as: FA
  
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
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    has_error = field_has_error?(form, assigns.field)
    has_change = field_has_change?(form, assigns.field)

    ~F"""
      <Field class="field" name={@field}>
        <Label :if={@label} class="label">{@label}</Label>
        <div class={"control", "has-icons-right": !@disable_icons && (has_error || has_change)}>
          <TextArea
          class={[
            "textarea",
            "is-#{@size}",
            "is-danger": has_error,
            "is-success": has_change && !has_error,
            ] ++ @class}
          field={@field}
          opts={
            placeholder: @placeholder,
            rows: @rows
            }/>
          <ErrorTag class="help is-danger" field={@field}/>
          <FA :if={!@disable_icons && has_error} icon="exclamation-triangle" container_class={["is-small", "is-right"]}/>
          <FA :if={!@disable_icons &&  has_change && !has_error} icon="check" container_class={["is-small", "is-right"]}/>
        </div>
      </Field>
    """
  end
end