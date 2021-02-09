defmodule SurfaceBulma.Title do
  @moduledoc """
  <hX> elements of title type
  """

  use Surface.Component

  @doc "Size of the title"
  prop size, :string, values: ["1", "2", "3", "4", "5", "6"]

  @doc "If placed above a subtitle it will be pulled together unless this prop is set"
  prop spaced, :boolean

  slot default

  def render(assigns) do
    ~H"""
    <h1 :if={{@size == "1"}} class={{"title", "is-1", "is-spaced": @spaced}}><slot/></h1>
    <h2 :if={{@size == "2"}} class={{"title", "is-2", "is-spaced": @spaced}}><slot/></h2>
    <h3 :if={{@size == "3"}} class={{"title", "is-3", "is-spaced": @spaced}}><slot/></h3>
    <h4 :if={{@size == "4"}} class={{"title", "is-4", "is-spaced": @spaced}}><slot/></h4>
    <h5 :if={{@size == "5"}} class={{"title", "is-5", "is-spaced": @spaced}}><slot/></h5>
    <h6 :if={{@size == "6"}} class={{"title", "is-6", "is-spaced": @spaced}}><slot/></h6>
    """
  end
end
