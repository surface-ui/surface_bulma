defmodule SurfaceBulma.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form.{Field, Checkbox}

  include(Checkbox)

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Extra classes for the label"
  prop label_class, :css_class, default: nil

  @doc "Extra classes for the field"
  prop field_class, :css_class, default: []

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    ~F"""
    <Field name={@field} class="field">
      <div class="control">
        <label class={"checkbox", @label_class} disabled={@disabled}>
          <Checkbox opts={[disabled: @disabled] ++ @opts} {...included_props(assigns, Checkbox)} />
          <#slot />
        </label>
      </div>
    </Field>
    """
  end
end
