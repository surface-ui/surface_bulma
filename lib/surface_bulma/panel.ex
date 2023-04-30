defmodule SurfaceBulma.Panel do
  use SurfaceBulma.TabUtils,
    doc: """
    The panel for compact controls and tabs
    """

  use SurfaceBulma.ColorProp

  include(TabsRow, only: [:expanded, style: [as: :tabs_style]])

  @doc "A class to set on the tabs container"
  prop tabs_class, :css_class, default: []

  @doc """
  This slot will be used as the title of the panel.
  """
  slot title, required: true

  @doc """
  A panel-block that will be displayed above the tabs
  """
  slot header

  slot tabs

  @impl true
  def render(assigns) do
    ~F"""
    <nav class={"panel", "is-#{@color}": @color}>
      <p class="panel-heading">
        <#slot {@title} />
      </p>
      {#if slot_assigned?(:header)}
        {#for item <- @header}
          <#slot {item} />
        {/for}
      {/if}
      <TabsRow
        :if={slot_assigned?(:tabs)}
        tabs={@tabs}
        class={@tabs_class}
        {...included_props(assigns, TabsRow)}
        inside_panel
        {=@active_tab_index}
        target={@myself}
      />
      {#if slot_assigned?(:tabs)}
        <Context
          put={SurfaceBulma.Link, context_class: "panel-block"}
          put={SurfaceBulma.Item, context_class: "panel-block"}
          put={SurfaceBulma.Button, is_addon: true}
        >
          {#for {tab, index} <- Enum.with_index(@tabs)}
            {#if tab.visible && @active_tab_index == index}
              <#slot {tab} />
            {/if}
          {/for}
        </Context>
      {/if}
    </nav>
    """
  end
end
