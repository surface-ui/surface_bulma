defmodule SurfaceBulma.Navbar.Brand do
  use Surface.Component, slot: "brand"

  @doc "Can contain `SurfaceBulma.Item` or a SurfaceBulma.Link."
  slot default
end
