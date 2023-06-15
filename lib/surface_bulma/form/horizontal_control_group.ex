defmodule SurfaceBulma.Form.HorizontalControlGroup do
  @moduledoc """
  Structural component that creates horizontal control groups.
  As defined here: https://bulma.io/documentation/form/general/#form-group

  You cannot use labels on the internal form controls or it will break the layout.
  """

  use SurfaceBulma.Component

  alias Surface.Components.Form.{Label}

  use SurfaceBulma.SizeProp

  @doc "The string label of the control group"
  prop label, :string

  slot default

  def render(assigns) do
    ~F"""
    <div class="field is-horizontal">
      <div class={[
        "field-label",
        "is-#{@size}": @size
      ]}>
        <Label :if={@label} class="label">{@label}</Label>
      </div>
      <div class="field-body">
        <#slot />
      </div>
    </div>
    """
  end
end
