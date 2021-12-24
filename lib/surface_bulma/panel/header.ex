defmodule SurfaceBulma.Panel.Header do
  use Surface.Component, slot: "header"
  require SurfaceBulma.Component
  alias SurfaceBulma.Component

  Component.include(SurfaceBulma.Panel.Tab.TabItem)

  defdelegate render(assigns), to: SurfaceBulma.Panel.Tab.TabItem
end
