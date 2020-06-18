defmodule SurfaceBulma.Tag do
  @moduledoc """
  Tag is very useful as a way to attach information to a block or other component. Its size makes
  it also easy to display in numbers, making it appropriate for long lists of items.
  """

  use Surface.Component

  @doc "The label of the tag, when no content (default slot) is provided"
  property label, :string

  @doc "The color of the tag"
  property color, :string,
    values: ~w(black dark light white primary link info success warning danger)

  @doc "The size of the delete"
  property size, :string, values: ~w(normal medium large)

  @doc "Light style"
  property light, :boolean

  @doc "Rounded style"
  property rounded, :boolean

  @doc """
  The content of the generated `<span>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~H"""
    <span
      class={{
        "tag",
        "is-#{@color}": @color,
        "is-#{@size}": @size,
        "is-light": @light,
        "is-rounded": @rounded
      }}>
      <slot>{{ @label }}</slot>
    </span>
    """
  end
end
