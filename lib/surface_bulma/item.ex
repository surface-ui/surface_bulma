defmodule SurfaceBulma.Item do
  @moduledoc """
  A general purpose component that can be re-used in other components such as the `Navbar` and `Dropdown`.
  """
  use Surface.Component
  use SurfaceBulma.ContextClass

  prop tag, :string
  data context_tag, :string, from_context: {SurfaceBulma.Item, :context_tag}
  slot default, required: true

  def render(assigns) do
    ~F"""
    {{:safe, [?<, @tag || @context_tag || "div", ?\s, "class", ?=, ?", @context_class || "", ?", ?>]}}
    <#slot />
    {{:safe, [?<, ?/, @tag || @context_tag || "div", ?>]}}
    """
  end
end
