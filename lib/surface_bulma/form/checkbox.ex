defmodule SurfaceBulma.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form.{Field, Checkbox}

  include(Checkbox)

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "The text / label of the checkbox. If no content is provided the label will be used."
  slot default
  prop label, :string

  def render(assigns) do
    ~F"""
      <Field name={@field} class="field">
        <div class="control">
          <label class="checkbox" disabled={@disabled}>
            <Checkbox
              opts={[disabled: @disabled] ++ @opts }
              {...included_props(assigns)}
              />
            <#slot>{@label}</#slot>
          </label>
        </div>
      </Field>
    """
  end
end
