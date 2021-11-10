defmodule SurfaceBulma.Dropdown.Trigger do
  use Surface.Component

  @moduledoc """
  Trigger for opening the dropdown menu
  """


  def render(assigns) do
    ~F"""
    <div class="dropdown-trigger">
      <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
        <span>Dropdown button</span>
        <span class="icon is-small">
          <i class="fas fa-angle-down" aria-hidden="true" />
        </span>
      </button>
    </div>
    """
  end
end
