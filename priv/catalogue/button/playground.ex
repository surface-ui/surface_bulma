defmodule SurfaceBulma.Catalogue.Button.Playground do
  @moduledoc false
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Button,
    catalogue: SurfaceBulma.Catalogue,
    height: "110px",
    container: {:div, class: "buttons is-centered"}

  data props, :map,
    default: %{
      label: "My Button",
      color: "success"
    }

  def render(assigns) do
    ~F"""
    <Button :props={{ @props }} />
    """
  end
end
