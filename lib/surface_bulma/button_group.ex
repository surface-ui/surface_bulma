defmodule SurfaceBulma.ButtonGroup do
  @moduledoc """
  Group of buttons.

  https://bulma.io/documentation/elements/button/#list-of-buttons
  """
  use Surface.Component

  @doc "Are buttons attached to eachother?"
  prop attached, :boolean

  @doc "Aligned left, right or center"
  prop aligned, :string, values: ~w(left centered right)

  slot default

  def render(assigns) do
    ~H"""
    <div class={{"buttons", "has-addons": @attached, "is-#{@aligned}": @aligned}}>
    <slot/>
    </div>
    """
  end
end
