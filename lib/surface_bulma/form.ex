defmodule SurfaceBulma.Form do
  @moduledoc """
  The form component that wraps the inputs.
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form

  include(Form)

  slot default, arg: %{form: :form}

  defdelegate render(assigns), to: Surface.Components.Form
end
