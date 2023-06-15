defmodule SurfaceBulma.Modal.Card do
  use Surface.Component

  @moduledoc """
  The card **modal**, with various configuration options.
  The modal is a stateless component and as such requires outside
  handling of whether or not the modal should be shown.

  Pressing the "Escape" key will cause the `close_event` to fire.

  This component is currently not usable with javascript control of
  if component should be shown or not.
  """

  @doc "If modal should be shown or not, defaults to false"
  prop show, :boolean, default: false

  @doc "If modal should show close button at top right of card"
  prop show_close_button, :boolean, default: true

  @doc "What event to emit on close event"
  prop close_event, :event, default: %{name: "modal_close", target: :live_view}

  @doc "Header content, use via Modal.Header"
  slot header

  @doc "Footer content, use via Modal.Footer"
  slot footer

  @doc "Default slot"
  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class={"modal", "is-active": @show} phx-window-keyup={@close_event.name} phx-key="Esc">
      <div class="modal-background" />
      <div class="modal-card">
        <header
          :if={@show_close_button || slot_assigned?(:header)}
          class={"modal-card-head", "is-flex-direction-column": !slot_assigned?(:header) && @show_close_button}
        >
          <p :if={slot_assigned?(:header)} class="modal-card-title"><#slot {@header} /></p>
          <a
            :if={@show_close_button}
            :on-click={@close_event}
            class={"delete", "is-align-self-flex-end": !slot_assigned?(:header) && @show_close_button}
            aria-label="close"
          />
        </header>
        <section class="modal-card-body">
          <#slot />
        </section>
        <footer :if={slot_assigned?(:footer)} class="modal-card-foot" style="justify-content: flex-end">
          <#slot {@footer} />
        </footer>
      </div>
    </div>
    """
  end
end
