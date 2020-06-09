defmodule SurfaceBulma.Button do
  @moduledoc """
  The classic **button**, in different colors, sizes, and states
  """

  use Surface.Component

  @doc "The label of the button, when no content (default slot) is provided"
  property label, :string

  @doc "The color of the button"
  property color, :string,
    values: ~w(white black light dark primary link info success warning danger)

  @doc "The vertical size of button"
  property size, :string, values: ~w(small normal medium large)

  @doc "Button is expanded (full-width)"
  property expand, :boolean

  @doc "Set the button as disabled preventing the user from interacting with the control"
  property disabled, :boolean

  @doc "Outlined style"
  property outlined, :boolean

  @doc "Rounded style"
  property rounded, :boolean

  @doc "Hovered style"
  property hovered, :boolean

  @doc "Focused style"
  property focused, :boolean

  @doc "Active style"
  property active, :boolean

  @doc "Selected style"
  property selected, :boolean

  @doc "Loading state"
  property loading, :boolean

  @doc "Triggered on click"
  property click, :event

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~H"""
    <button
      type="button"
      :on-phx-click={{@click}}
      disabled={{@disabled}}
      class={{
        "button",
        "is-#{@color}": @color,
        "is-#{@size}": @size,
        "is-fullwidth": @expand,
        "is-outlined": @outlined,
        "is-rounded": @rounded,
        "is-hovered": @hovered,
        "is-focused": @focused,
        "is-active": @active,
        "is-loading": @loading,
        "is-selected": @selected,
      }}>
      <slot>{{ @label }}</slot>
    </button>
    """
  end
end
