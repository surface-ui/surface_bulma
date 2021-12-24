defmodule SurfaceBulma.Panel do
  use SurfaceBulma.TabUtils,
    doc: """
    The panel for compact controls and tabs
    """

  alias SurfaceBulma.Icon.FontAwesome, as: FA

  use SurfaceBulma.ColorProp

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
        <#slot name="title" />
      </p>
      {#if slot_assigned?(:header)}
        {#for {_, index} <- Enum.with_index(@header)}
          <#slot name="header" index={index} />
        {/for}
      {/if}
      <p :if={slot_assigned?(:tabs)} class="panel-tabs">
        {#for {tab, index} <- Enum.with_index(@tabs)}
          <a class={"is-active": index == @active_tab}
            :on-click={tab.click || "tab_click"} phx-value-index={index}>
            <FA :if={tab.icon} icon={tab.icon} />{tab.title}
          </a>
        {/for}
      </p>
      {#if slot_assigned?(:tabs) }
        {#for {tab, index} <- Enum.with_index(@tabs)}
          {#if tab.visible && @active_tab == index}
            <#slot name="tabs" index={index} />
          {/if}
        {/for}
      {/if}
    </nav>
    """
  end
end
