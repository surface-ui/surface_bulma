defmodule SurfaceBulma.SubTitle do
  @moduledoc """
  <hX> elements of subtitle type
  """

  use Surface.Component

  @doc "Size of the subtitle"
  prop size, :string, values: ["1", "2", "3", "4", "5", "6"]

  slot default

  def render(assigns) do
    ~H"""
    <h1 :if={{@size == "1"}} class={{"subtitle", "is-1"}}><slot/></h1>
    <h2 :if={{@size == "2"}} class={{"subtitle", "is-2"}}><slot/></h2>
    <h3 :if={{@size == "3"}} class={{"subtitle", "is-3"}}><slot/></h3>
    <h4 :if={{@size == "4"}} class={{"subtitle", "is-4"}}><slot/></h4>
    <h5 :if={{@size == "5"}} class={{"subtitle", "is-5"}}><slot/></h5>
    <h6 :if={{@size == "6"}} class={{"subtitle", "is-6"}}><slot/></h6>
    """
  end
end
