defmodule SurfaceBulma.Form.HiddenInputs do
  use SurfaceBulma.Component

  alias Surface.Components.Form.HiddenInputs
  include(HiddenInputs)

  defdelegate render(assigns), to: HiddenInputs
end
