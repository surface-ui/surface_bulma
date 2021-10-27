defmodule SurfaceBulma.Form do
  use SurfaceBulma.Component
  alias Surface.Components.Form

  include(Form)

  slot default, args: [:form]
  defdelegate render(assigns), to: Form
end
