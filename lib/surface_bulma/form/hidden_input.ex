defmodule SurfaceBulma.Form.HiddenInput do
  use SurfaceBulma.Component

  include(Surface.Components.Form.HiddenInput)

  defdelegate render(assigns), to: Surface.Components.Form.HiddenInput
end
