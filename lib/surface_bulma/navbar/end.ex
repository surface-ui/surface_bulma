defmodule SurfaceBulma.Navbar.End do
  use Surface.Component, slot: "nav_end"
  slot items
  defdelegate render(assigns), to: SurfaceBulma.Navbar.Start
end
