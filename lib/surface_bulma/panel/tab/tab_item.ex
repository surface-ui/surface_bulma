defmodule SurfaceBulma.Panel.Tab.TabItem do
  use Surface.Component, slot: "panel_tab_items"
  alias SurfaceFontAwesome.Icon

  prop is_active, :boolean

  prop icon, :string

  prop type, :string

  # put={SurfaceBulma.Item, item_class: "navbar-item"}
  # put={SurfaceBulma.Link, context_class: "navbar-item"}
  slot default

  def render(assigns) do
    block_classes = ["panel-block", "is-active": assigns[:is_active]]

    ~F"""
    <Context put={SurfaceBulma.Divider, context_class: "navbar-divider"}>
      {#case @type}
        {#match "link"}
          <a class={block_classes}>
            {render_icon(assigns)}
            <#slot />
          </a>
        {#match "input"}
          {render_icon(assigns)}
          <div class={block_classes}>
            <div class="control">
              <#slot />
            </div>
          </div>
        {#match _}
          <div class={block_classes}>
            {render_icon(assigns)}
            <#slot />
          </div>
      {/case}
    </Context>
    """
  end

  def render_icon(assigns) do
    ~F"""
    <span :if={@icon} class="panel-icon">
      <Icon icon={@icon} />
    </span>
    """
  end
end
