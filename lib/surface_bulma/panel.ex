defmodule SurfaceBulma.Panel do
  @moduledoc """
   Test
  """
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
        <#slot
          {@title}
          context_put={SurfaceBulma.Link, context_class: "panel-block"}
          context_put={SurfaceBulma.Item, context_class: "panel-block"}
          context_put={SurfaceBulma.Button, is_addon: true}
        />
      </p>
      {#if slot_assigned?(:header)}
        {#for item <- @header}
          <#slot
            {item}
            context_put={SurfaceBulma.Link, context_class: "panel-block"}
            context_put={SurfaceBulma.Item, context_class: "panel-block"}
            context_put={SurfaceBulma.Button, is_addon: true}
          />
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
        {#for {tab, index} <- Enum.with_index(@tabs)}
          {#if tab.visible && @active_tab_index == index}
            <#slot
              {tab}
              context_put={SurfaceBulma.Link, context_class: "panel-block"}
              context_put={SurfaceBulma.Item, context_class: "panel-block"}
              context_put={SurfaceBulma.Button, is_addon: true}
            />
          {/if}
        {/for}
      {/if}
    </nav>
    """
  end
end
