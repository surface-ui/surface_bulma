defmodule SurfaceBulma.Tabs.TabItem do
  @moduledoc """
  Defines a tab item for the parent tabs component.

  The tab item instance is automatically added to the
  parent's `tabs` slot.
  """

  use Surface.Component, slot: "tabs"

  @doc "Item label"
  property label, :string, default: ""

  @doc "Item icon"
  property icon, :string

  @doc "Item is disabled"
  property disabled, :boolean, default: false

  @doc "Item is visible"
  property visible, :boolean, default: true
end
