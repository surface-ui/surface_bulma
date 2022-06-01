defmodule SurfaceBulma.Notification do
  @moduledoc """
  The notification is a simple colored block meant to draw the attention to the user about something.
  """

  use Surface.Component
  prop class, :css_class

  @doc "If modal should show close button at top right of card"
  prop show_close_button, :boolean, default: true

  prop message, :string

  slot default

  def render(assigns) do
    ~F"""
      <div :if={@message || slot_assigned?(:default)} class={"notification", @class}>
        <button :if={@show_close_button} class="delete"></button>
        <#slot>{@message}</#slot>
      </div>
    """
  end
end
