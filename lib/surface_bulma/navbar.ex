defmodule SurfaceBulma.Navbar do
  use Surface.LiveComponent

  use SurfaceBulma.ColorProp

  slot brand

  slot nav_start

  slot nav_end

  data menu_visible, :boolean, default: false

  def render(assigns) do
    ~F"""
    <nav class={"navbar", "is-#{@color}": @color} role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <#slot
          {@brand}
          context_put={SurfaceBulma.Item, context_class: "navbar-item"}
          context_put={SurfaceBulma.Link, context_class: "navbar-item"}
          context_put={SurfaceBulma.Divider, context_class: "navbar-divider"}
        />
        <a
          role="button"
          :on-click="toggle-menu"
          class="navbar-burger"
          aria-label="menu"
          aria-expanded="false"
        >
          <span aria-hidden="true" />
          <span aria-hidden="true" />
          <span aria-hidden="true" />
        </a>
      </div>
      <div class={"navbar-menu", "is-active": @menu_visible}>
        <div class="navbar-start">
          <#slot
            {@nav_start}
            context_put={SurfaceBulma.Item, context_class: "navbar-item"}
            context_put={SurfaceBulma.Link, context_class: "navbar-item"}
            context_put={SurfaceBulma.Divider, context_class: "navbar-divider"}
          />
        </div>
        <div class="navbar-end">
          <#slot
            {@nav_end}
            context_put={SurfaceBulma.Item, context_class: "navbar-item"}
            context_put={SurfaceBulma.Link, context_class: "navbar-item"}
            context_put={SurfaceBulma.Divider, context_class: "navbar-divider"}
          />
        </div>
      </div>
    </nav>
    """
  end

  def handle_event("toggle-menu", _, socket) do
    {:noreply, assign(socket, menu_visible: socket.assigns.menu_visible != true)}
  end
end
