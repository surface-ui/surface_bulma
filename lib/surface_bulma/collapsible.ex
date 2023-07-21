defmodule SurfaceBulma.Collapsible do
  use SurfaceBulma.Component, propagate_context_to_slots: true
  alias Phoenix.LiveView.JS
  alias SurfaceBulma.Icon.FontAwesome, as: FA

  prop(id, :string, required: true)
  prop(class, :css_class, default: [])
  prop(header_class, :css_class)
  prop(collapsed, :boolean, default: true)
  prop(collapsible?, :boolean, default: true)
  prop(shadow, :boolean, default: false)
  prop(body_class, :css_class, default: [])
  prop(remove, :event)
  prop(title, :string)
  prop(icon, :string)
  prop(toggle_icon, :any)
  prop(sortable?, :boolean, default: false)
  prop(is_collapsed?, :boolean)

  slot(default, required: true)
  slot(header)
  slot(header_icon)

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
    <div id={@id} class={["card", "is-shadowless": !@shadow, sortable: @sortable?] ++ @class}>
      <div class={"is-clickable", "card-header", "flex", @header_class}>
        <div class="card-header-title">
          <div :if={@sortable?} class="sortable-handle">
            <FA icon="sort" />
          </div>
          <!--div :on-click={JS.toggle(to: "##{@id} .card-content")}>
            <FA icon={toggle_icon(assigns)} />
          </div-->
          <div
            :if={@collapsible?}
            :on-click={JS.toggle(to: "##{@id} .card-content")
            |> JS.toggle(to: "##{@id} .angle-down")
            |> JS.toggle(to: "##{@id} .angle-up")}
          >
            <span class={"angle-down", hidden: !@collapsed}><FA icon="angle-down" /></span>
            <span class={"angle-up", hidden: @collapsed}><FA icon="angle-up" /></span>
          </div>
          <span>{@title}</span>
          <#slot {@header} />
        </div>
        {#if slot_assigned?(:header_icon)}
          {#for item <- @header_icon}
            <Context put={SurfaceBulma.Button, context_class: "card-header-icon"}>
              <#slot {item} />
            </Context>
          {/for}
        {#else}
          <div class="card-header-icon">
            <div :if={@remove} class="has-text-danger is-clickable" :on-click={@remove}>
              <FA icon="trash" />
            </div>
          </div>
        {/if}
      </div>
      <div class={["card-content", hidden: @collapsed == @collapsible?] ++ @body_class}>
        <#slot />
      </div>
    </div>
    """
  end
end

defmodule SurfaceBulma.Collapsible.Header do
  use Surface.Component, slot: "header"
end
