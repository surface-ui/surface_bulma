defmodule SurfaceBulma.Tabs do
  @moduledoc """
  A simple horizontal navigation **tabs** component
  """
  use SurfaceBulma.TabUtils

  @doc "Make tab full width"
  prop expanded, :boolean, default: false

  @doc "Classic style with borders"
  prop boxed, :boolean, default: false

  @doc "The tabs to display"
  slot tabs, required: true

  def render(assigns) do
    ~F"""
    <div class={"is-fullwidth": @expanded}>
      <nav class={"tabs",  "is-boxed": @boxed, "is-fullwidth": @expanded}>
        <ul>
          <li
            :for={{tab, index} <- Enum.with_index(@tabs), tab.visible}
            class={"is-active": @active_tab == index, isDisabled: tab.disabled}
          >
            <a :on-click="tab_click" phx-value-index={index}>
              <span :if={tab.icon} class="icon is-small">
                <i class={tab.icon} aria-hidden="true"></i>
              </span>
              <span>{tab.label}</span>
            </a>
          </li>
        </ul>
      </nav>
      <section class="tab-content" style="overflow: hidden;">
        <div
          :for={{tab, index} <- Enum.with_index(@tabs)}
          :show={tab.visible && @active_tab == index}
          class={"tab-item animated #{@animation} faster"}
        >
          <#slot name="tabs" index={index}/>
        </div>
      </section>
    </div>
    """
  end
end
