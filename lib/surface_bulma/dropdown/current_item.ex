defmodule SurfaceBulma.Dropdown.CurrentItem do
  use Surface.Component, slot: "current_item"

  @moduledoc """
  Contents to be displayed in the trigger
  """

  slot default, required: true

end
