defmodule SurfaceBulma.Icon do
  @moduledoc false

  use Surface.Component

  defmacro __using__(opts) do
    quote do
      use Surface.Component
      alias SurfaceBulma.Icon
      @doc "The icon to display"
      prop icon, :string, required: true, values: unquote(opts[:icon_names])

      @doc "The size of the icon"
      prop size, :string, values: unquote(opts[:icon_sizes])

      @doc "The size of the icon container"
      prop container_size, :string, values: ["small", "medium", "large"]

      @doc "Specifies if the icon should be animated and which animation to use."
      prop animated, :string, values: unquote(Keyword.get(opts, :animations, []))
    end
  end
end
