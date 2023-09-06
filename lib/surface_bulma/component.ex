defmodule SurfaceBulma.Component do
  defmacro __using__(_) do
    quote do
      use Surface.Component
      import SurfaceUtils
    end
  end
end
