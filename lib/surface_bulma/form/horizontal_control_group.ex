defmodule SurfaceBulma.Form.HorizontalControlGroup do
  @moduledoc """
  The text field component
  """

  use Surface.Component

  alias Surface.Components.Form.{Label}

  @doc "Size of select in css sense"
  prop size, :string, values: ["small", "normal", "medium", "large"]

  @doc "The string label of the control group"
  prop label, :string

  slot default

  def render(assigns) do
    ~H"""
    <div class="field is-horizontal">
      <div class={{
        [
          "field-label",
          "is-#{@size}": @size
        ]
      }}>
        <Label :if={{@label}} class="label">{{@label}}</Label>
      </div>
      <div class="field-body">
      <slot/>
      </div>
    </div>
    """
  end
end
