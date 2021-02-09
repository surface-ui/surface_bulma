defmodule SurfaceBulma.Icon.FontAwesome do
  @moduledoc """
  A component that displays an icon compatible with the FontAwesome icons
  """

  alias SurfaceFontAwesome.Icon
  use SurfaceFontAwesome, :icon

  @doc "Specifies the size of the span that wraps the icon."
  prop container_size, :string, values: ["small", "medium", "large"]

  @doc "Optional classes to add to containing span"
  prop container_class, :list, default: []

  slot default

  def render(assigns) do
    ~H"""
      <span class={{["icon", "is-#{@container_size}": @container_size] ++ @container_class}}>
        {{ Icon.render(assigns) }}
        <slot name="default" />
      </span>
    """
  end
end

defmodule SurfaceBulma.Icon.FontAwesome.Layers do
  alias SurfaceFontAwesome.Layers
  use SurfaceFontAwesome, :layers

  @doc "Specifies the size of the span that wraps the icon."
  prop container_size, :string, values: ["small", "medium", "large"]

  @doc "Optional classes to add to containing span"
  prop container_class, :list, default: []

  def render(assigns) do
    ~H"""
    <span class={{["icon", "is-#{@container_size}": @container_size] ++ @container_class}}>
      {{ Layers.render(assigns) }}
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
    ~H"""
    <span class="icon-text">
      <slot/>
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
    ~H"""
    <span>
    <slot/>
    </span>
    """
  end
end
