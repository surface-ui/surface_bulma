defmodule SurfaceBulma.Dropdown do
  use Surface.LiveComponent

  @moduledoc """
  An interactive dropdown menu for discoverable content.

  [Bulma Docs - Dropdown](https://bulma.io/documentation/components/dropdown/)
  """

  @doc "Is always open"
  prop is_active, :boolean

  @doc "Activates on hover"
  prop is_hoverable, :boolean

  @doc "Left/Right aligned (left by default)"
  prop is_right, :boolean, default: false

  @doc "Menu appears above/below (below by default)"
  prop is_up, :boolean, default: false

  slot current_item, required: true

  slot menu_items, required: true

  data open, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div
      class={
        "dropdown",
        "is-right": @is_right,
        "is-up": @is_up,
        "is-active": @is_active || @open,
        "is-hoverable": @is_hoverable
      }
      :on-click="toggle"
    >
        <div class="dropdown-trigger">
        <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
          <span><#slot name="current_item" /></span>
          <span class="icon is-small">
            <i class="fas fa-angle-down" aria-hidden="true" />
          </span>
        </button>
      </div>
      <div class="dropdown-menu" id="dropdown-menu" role="menu">
        <div class="dropdown-content">
          {#for {_, index} <- Enum.with_index(@menu_items)}
            <#slot name="menu_items" index={index} />
          {/for}
        </div>
      </div>
    </div>
    """
  end

  def handle_event("toggle", _, socket) do
    {:noreply, update(socket, :open, &(not &1))}
  end
end
