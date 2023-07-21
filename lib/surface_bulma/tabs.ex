defmodule SurfaceBulma.Tabs do
  @moduledoc """
  Test  tab
  """
  use SurfaceBulma.TabUtils,
    doc: """
    A simple horizontal navigation **tabs** component.
    """

  include(TabsRow, only: [:expanded, :style])

  @doc "The tabs to display"
  slot tabs, required: true

  def render(assigns) do
    ~F"""
    <div class={"is-fullwidth": @expanded}>
      <TabsRow
        {...included_props(assigns, TabsRow)}
        {=@tabs}
        {=@style}
        {=@expanded}
        {=@active_tab_index}
        target={@myself}
      />

      <section class="tab-content" style="overflow: hidden;">
        <div
          :for={{tab, index} <- Enum.with_index(@tabs)}
          :show={tab.visible && @active_tab_index == index}
          class={"tab-item animated #{@animation} faster"}
        >
          <#slot {tab} />
        </div>
      </section>
    </div>
    """
  end
end
