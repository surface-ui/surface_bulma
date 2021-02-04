defmodule SurfaceBulma.Form.TextField do
  @moduledoc """
  The text field component
  """

  use Surface.Component
  import SurfaceBulma.Form, only: [field_has_error?: 2, field_has_change?: 2]

  alias Surface.Components.Form.{Field, TextInput, ErrorTag, Label}
  alias SurfaceBulma.Icon.FontAwesome, as: FA

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "The string label of the field"
  prop label, :string, required: true

  @doc "Disable embedded font awesome icons"
  prop disable_icons, :boolean, default: false

  def render(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    has_error = field_has_error?(form, assigns.field)
    has_change = field_has_change?(form, assigns.field)

    ~H"""
      <Field class="field" name={{@field}}>
        <Label class="label">{{@label}}</Label>
        <div class={{"control", "has-icons-right": !@disable_icons && (has_error || has_change)}}>
          <TextInput class={{"input", "is-danger": has_error, "is-success": has_change && !has_error}} field={{@field}}/>
          <ErrorTag class="help is-danger" field={{@field}}/>
          <FA :if={{ !@disable_icons && has_error }} icon="exclamation-triangle" container_class={{["is-small", "is-right"]}}/>
          <FA :if={{ !@disable_icons &&  has_change && !has_error}} icon="check" container_class={{["is-small", "is-right"]}}/>
        </div>
      </Field>
    """
  end
end
