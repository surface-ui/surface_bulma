defmodule SurfaceBulma.TabsRow do
  @moduledoc false

  use Surface.Component

  prop class, :css_class, default: []
  prop tabs, :list, required: true
  prop active_tab_index, :integer, required: true
  prop inside_panel, :boolean, default: false
  prop alignment, :string, values: ~w/centered right/, default: "centered"
  prop style, :string, values: ~w/boxed toggle rounded/
  prop target, :any, required: true

  @doc "Make tab full width"
  prop expanded, :boolean

  def render(assigns) do
    ~F"""
    <div class={["tabs", "is-#{@alignment}", "panel-tabs": @inside_panel, "is-fullwidth": @expanded] ++
      style_classes(assigns) ++ normalize_class(@class)}>
      <ul>
        <li
          :for={{tab, index} <- Enum.with_index(@tabs), tab.visible}
          class={"is-active": @active_tab_index == index, isDisabled: tab.disabled}
        >
          <a :on-click="tab_click" phx-target={@target} phx-value-index={index}>
            <span :if={tab.icon} class="icon is-small">
              <i class={tab.icon} aria-hidden="true" />
            </span>
            <span>{tab.label}</span>
          </a>
        </li>
      </ul>
    </div>
    """
  end

  defp normalize_class(class) when is_binary(class), do: [class]
  defp normalize_class(class) when is_list(class), do: class

  defp style_classes(%{style: style}) do
    cond do
      is_nil(style) -> [""]
      style == "rounded" -> ["is-toggle", "is-toggle-rounded"]
      true -> ["is-#{style}"]
    end
  end
end
