defmodule SurfaceBulma.Modal do
  use Surface.Component
  alias SurfaceBulma.Button

  @moduledoc """
  The non-card **modal**, with various configuration options.
  The modal is a stateless component and as such requires outside
  handling of whether or not the modal should be shown.

  This component is currently not usable with javascript control of
  if component should be shown or not.
  """

  @doc "If modal should be shown or not, defaults to false"
  prop(show, :boolean, default: false)

  @doc "If modal should show close button at top right of darkened background"
  prop(show_close_button, :boolean, default: true)

  @doc "The event the modal emits if you click the close button, silently ignored if show close button is not set"
  prop(close_button_event, :event)

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div class={"modal", "is-active": @show}>
      <div class="modal-background" />
      <div class="modal-content">
        <#slot />
      </div>
      <Button
        type={nil}
        :if={@show_close_button}
        click={@close_button_event}
        class="modal-close is-large"
        aria_label="close"
      />
    </div>
    """
  end
end
