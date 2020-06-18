defmodule SurfaceBulma.Delete do
  @moduledoc """
  The delete component is a stand-alone element that can be used in different contexts. On its own,
  it's a simple circle with a cross.
  """

  use Surface.Component

  @doc "The size of the delete"
  property size, :string, values: ~w(small medium large)

  @doc "Triggered on click"
  property click, :event

  def render(assigns) do
    ~H"""
    <a
      :on-phx-click={{ @click }}
      class={{
        "delete",
        "is-#{@size}": @size
      }}>
    </a>
    """
  end
end
