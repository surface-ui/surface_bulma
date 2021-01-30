defmodule SurfaceBulma.Catalogue.Button.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    title: "Colors & Sizes",
    direction: "vertical",
    height: "110px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~H"""
    <Button>Default</Button>
    <Button size="small" color="info">Small</Button>
    <Button size="normal" color="primary">Normal</Button>
    <Button size="medium" color="warning">Medium</Button>
    <Button size="large" color="danger">Large</Button>
    """
  end
end
