defmodule SurfaceBulma.Form.Inputs do
  use SurfaceBulma.Component
  alias Surface.Components.Form.Inputs
  include(Inputs)

  slot default

  defdelegate render(assigns), to: Inputs
end
