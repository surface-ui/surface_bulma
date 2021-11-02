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
        <#slot name="brand" />
        <a role="button" :on-click="toggle-menu" class="navbar-burger" aria-label="menu" aria-expanded="false">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>
      <div class={"navbar-menu", "is-active": @menu_visible}>
        <div class="navbar-start">
          <#slot name="nav_start" />
        </div>
        <div class="navbar-end">
          <#slot name="nav_end" />
        </div>
      </div>
    </nav>
    """
  end

  def handle_event("toggle-menu", _, socket) do
    {:noreply, assign(socket, menu_visible: socket.assigns.menu_visible != true)}
  end
end
