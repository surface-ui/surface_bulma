defmodule SurfaceBulma.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form.{Field, Checkbox}

  include(Checkbox)

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    ~F"""
    <Field name={@field} class="field">
      <div class="control">
        <label class="checkbox" disabled={@disabled}>
          <Checkbox opts={[disabled: @disabled] ++ @opts} {...included_props(assigns, Checkbox)} />
          <#slot />
        </label>
      </div>
    </Field>
    """
  end
end
