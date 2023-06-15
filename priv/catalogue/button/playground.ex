defmodule SurfaceBulma.Catalogue.Button.Playground do
  @moduledoc """
  """
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    height: "110px",
    container: {:div, class: "buttons is-centered"},
    head_js: ""

  @props [
    label: "My Button",
    color: "warning"
  ]
  @slots []
  alias SurfaceBulma.Button

  def render(assigns) do
    ~F"""
    <Button {...@props} />
    """
  end
end
