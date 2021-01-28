defmodule SurfaceBulma.Catalogue.Button.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    container: {:div, style: "height: 60px;"}

  data props, :map,
    default: %{
      label: "My Button",
      color: "success"
    }

  def render(assigns) do
    ~H"""
    <Button :props={{ @props }} />
    """
  end
end
