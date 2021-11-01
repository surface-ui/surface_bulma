defmodule SurfaceBulma.Catalogue.Button.Example01 do
  @moduledoc """
  """
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    title: "Label",
    height: "90px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~F"""
    <Button label="Label"/>
    <Button>Slot</Button>
    """
  end
end
