defmodule SurfaceBulma.Form.Label do

  use SurfaceBulma.Component
  alias Surface.Components.Form.Label
  include Label

  slot default

  defdelegate render(assigns), to: Label
end
