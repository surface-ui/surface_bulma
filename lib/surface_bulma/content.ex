defmodule SurfaceBulma.Content do
  @moduledoc """
  A single class to handle WYSIWYG generated content, where only HTML tags are available.
  """

  use Surface.Component
  prop class, :css_class

  slot default, required: true

  def render(assigns) do
    ~F"""
      <div class={"content", @class}>
        <#slot />
      </div>
    """
  end
end
