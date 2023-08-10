defmodule SurfaceBulma.Title do
  @moduledoc """
  `<hX>` elements of title type
  """

  use Surface.Component
  use SurfaceBulma.ClassProp

  @doc "Size of the title"
  prop size, :string, values: ["1", "2", "3", "4", "5", "6"]

  @doc "If placed above a subtitle it will be pulled together unless this prop is set"
  prop spaced, :boolean

  slot default

  def render(assigns) do
    ~F"""
    <h1 :if={@size in ["1", 1]} class={classes(assigns, ["title", "is-1", "is-spaced": @spaced])}><#slot /></h1>
    <h2 :if={@size in ["2", 2]} class={classes(assigns, ["title", "is-2", "is-spaced": @spaced])}><#slot /></h2>
    <h3 :if={@size in ["3", 3]} class={classes(assigns, ["title", "is-3", "is-spaced": @spaced])}><#slot /></h3>
    <h4 :if={@size in ["4", 4]} class={classes(assigns, ["title", "is-4", "is-spaced": @spaced])}><#slot /></h4>
    <h5 :if={@size in ["5", 5]} class={classes(assigns, ["title", "is-5", "is-spaced": @spaced])}><#slot /></h5>
    <h6 :if={@size in ["6", 6]} class={classes(assigns, ["title", "is-6", "is-spaced": @spaced])}><#slot /></h6>
    """
  end
end
