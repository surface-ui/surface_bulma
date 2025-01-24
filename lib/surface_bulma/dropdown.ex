defmodule SurfaceBulma.Dropdown do
  use Surface.LiveComponent

  @moduledoc """
  An interactive dropdown menu for discoverable content.

  [Bulma Docs - Dropdown](https://bulma.io/documentation/components/dropdown/)
  """

  @doc "Is always open"
  prop active, :boolean

  @doc "Activates on hover"
  prop hoverable, :boolean

  @doc "Left/Right aligned (left by default)"
  prop right_aligned, :boolean, default: false

  @doc "Menu appears above/below (below by default)"
  prop drop_up, :boolean, default: false

  slot trigger, required: true

  slot default, required: true

  data open, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div
      class={
        "dropdown",
        "is-right": @right_aligned,
        "is-up": @drop_up,
        "is-active": @active || @open,
        "is-hoverable": @hoverable
      }
      :on-click="toggle"
    >
      <div class="dropdown-trigger">
        <button class="button" aria-haspopup="true" aria-controls="dropdown-menu">
          <span><#slot {@trigger} /></span>
          <span class="icon is-small">
            <i class="fas fa-angle-down" aria-hidden="true" />
          </span>
        </button>
      </div>
      <div class="dropdown-menu" id="dropdown-menu" role="menu">
        <div class="dropdown-content">
          <#slot
            context_put={SurfaceBulma.Link, context_class: "dropdown-item"}
            context_put={SurfaceBulma.Item, context_class: "dropdown-item"}
            context_put={SurfaceBulma.Divider, context_class: "dropdown-divider"}
          />
        </div>
      </div>
    </div>
    """
  end

  def handle_event("toggle", _, socket) do
    {:noreply, update(socket, :open, &(not &1))}
  end
end
