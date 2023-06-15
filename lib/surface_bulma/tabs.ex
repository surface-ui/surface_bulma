defmodule SurfaceBulma.Tabs do
  @moduledoc """
  A simple horizontal navigation **tabs** component
  """
  use SurfaceBulma.TabUtils
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
