defmodule SurfaceBulma.Dropdown.Trigger do
  use Surface.Component, slot: "trigger"

  @moduledoc """
  Contents to be displayed in the trigger
  """

  slot default, required: true
end
