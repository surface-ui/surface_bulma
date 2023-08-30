defmodule SurfaceBulma.Collapsible do
  use SurfaceBulma.Component, propagate_context_to_slots: true
  alias Phoenix.LiveView.JS
  alias SurfaceBulma.Icon.FontAwesome, as: FA

  use SurfaceBulma.ClassProp
  prop id, :string, required: true
  prop header_class, :css_class
  prop collapsed, :boolean, default: true
  prop shadow, :boolean, default: false
  prop body_class, :css_class, default: []
  prop remove, :event
  prop title, :string
  prop icon, :string
  prop toggle_icon, :any
  prop is_collapsed?, :boolean
  prop hook, :string

  slot default, required: true
  slot header
  slot header_icon
  slot footer

  def update(assigns, socket) do
    {:ok,
     assign(socket, assigns)
     |> assign(
       :is_collapsed?,
       is_nil(socket.assigns[:is_collapsed?]) || socket.assigns.is_collapsed?
     )}
  end

  def render(assigns) do
    ~F"""
    <div id={@id} class={classes(assigns, ["card", "is-shadowless": !@shadow])}>
      <div class={"card-header", @header_class}>
        <div class="card-header-title">
          <#slot {@header} />
        </div>
        <div class="card-header-icon">
          <div :on-click={JS.toggle(to: "##{@id} .card-content")
          |> JS.toggle(to: "##{@id} .angle-down")
          |> JS.toggle(to: "##{@id} .angle-up")}>
            <span class={"angle-down", hidden: !@collapsed}><FA icon="angle-down" /></span>
            <span class={"angle-up", hidden: @collapsed}><FA icon="angle-up" /></span>
          </div>
        </div>
      </div>
      <div class={["card-content", hidden: @collapsed] ++ @body_class}>
        <#slot />
      </div>
      <div :if={slot_assigned?(:footer)} class="card-footer">
        <#slot {@footer} />
      </div>
    </div>
    """
  end
end
