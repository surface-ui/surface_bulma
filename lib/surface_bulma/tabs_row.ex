defmodule SurfaceBulma.TabsRow do
  @moduledoc false

  use Surface.Component

  alias SurfaceBulma.Icon.FontAwesome, as: Icon

  use SurfaceBulma.ClassProp
  prop(tabs, :list, required: true)
  prop(active_tab_index, :integer, required: true)
  prop(inside_panel, :boolean, default: false)
  prop(alignment, :string, values: ~w/centered right/, default: "centered")
  prop(style, :string, values: ~w/boxed toggle rounded/)
  prop(target, :any, required: true)

  @doc "Make tab full width"
  prop(expanded, :boolean)

  def render(assigns) do
    ~F"""
    <div class={classes(
      assigns,
      ["tabs", "is-#{@alignment}", "panel-tabs": @inside_panel, "is-fullwidth": @expanded] ++
        style_classes(assigns)
    )}>
      <ul>
        <li
          :for={{tab, index} <- Enum.with_index(@tabs), tab.visible}
          class={"is-active": @active_tab_index == index, isDisabled: tab.disabled}
        >
          <a :on-click="tab_click" phx-target={@target} phx-value-index={index}>
            <Icon :if={tab.icon} icon={tab.icon} />
            <span>{tab.label}</span>
          </a>
        </li>
      </ul>
    </div>
    """
  end

  defp style_classes(%{style: style}) do
    cond do
      is_nil(style) -> [""]
      style == "rounded" -> ["is-toggle", "is-toggle-rounded"]
      true -> ["is-#{style}"]
    end
  end
end
