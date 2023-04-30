defmodule SurfaceBulma.Icon.FontAwesome do
  @moduledoc """
  A component that displays an icon compatible with the FontAwesome icons
  """

  alias SurfaceFontAwesome.Icon
  use SurfaceFontAwesome, :icon
  use SurfaceBulma.ColorProp, "icon"

  @doc "Specifies the size of the span that wraps the icon."
  prop container_size, :string, values: ["small", "medium", "large"]

  @doc "Optional classes to add to containing span."
  prop container_class, :css_class, default: []

  slot default

  def render(assigns) do
    ~F"""
    <span class={["icon", "has-text-#{@color}": @color, "is-#{@container_size}": @container_size] ++
      @container_class}>
      {Icon.render(assigns)}
      <span :if={slot_assigned?(:default)}><#slot /></span>
    </span>
    """
  end
end

defmodule SurfaceBulma.Icon.FontAwesome.Layers do
  alias SurfaceFontAwesome.Layers
  use SurfaceFontAwesome, :layers

  @doc "Specifies the size of the span that wraps the icon."
  prop container_size, :string, values: ["small", "medium", "large"]

  @doc "Optional classes to add to containing span."
  prop container_class, :css_class, default: []

  def render(assigns) do
    ~F"""
    <span class={["icon", "is-#{@container_size}": @container_size] ++ @container_class}>
      {Layers.render(assigns)}
    </span>
    """
  end
end

defmodule SurfaceBulma.Icon.FontAwesome.CounterLayer do
  alias SurfaceFontAwesome.CounterLayer
  use SurfaceFontAwesome, :counter_layer

  def render(assigns), do: CounterLayer.render(assigns)
end

defmodule SurfaceBulma.Icon.FontAwesome.TextLayer do
  alias SurfaceFontAwesome.TextLayer
  use SurfaceFontAwesome, :text_layer

  def render(assigns), do: TextLayer.render(assigns)
end

defmodule SurfaceBulma.Icon.FontAwesome.TextIcon do
  use Surface.Component

  @moduledoc """
  Renders a icon text
  """
  slot default

  def render(assigns) do
    ~F"""
    <span class="icon-text">
      <#slot />
    </span>
    """
  end
end

defmodule SurfaceBulma.Icon.FontAwesome.TextIconText do
  use Surface.Component

  @moduledoc """
  The text that goes in a TextIcon component
  """
  slot default

  def render(assigns) do
    ~F"""
    <span>
      <#slot />
    </span>
    """
  end
end
