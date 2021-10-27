defmodule SurfaceBulma.Form.HiddenInput do
  @moduledoc """
  A thin wrapper around `Surface.Components.Form.HiddenInput`
  """
  use SurfaceBulma.Component

  include(Surface.Components.Form.HiddenInput)

  defdelegate render(assigns), to: Surface.Components.Form.HiddenInput
end
