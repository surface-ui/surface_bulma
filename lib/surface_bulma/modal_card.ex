defmodule SurfaceBulma.ModalCard do
  use Surface.Component

  @doc "If modal should be shown or not, defaults to false"
  prop(show, :boolean, default: false)
  prop(title, :string, default: "Modal")
  prop(return_to, :string)

  @doc "If modal should show close button at top right of darkened background"
  prop(show_close_button, :boolean, default: true)

  @doc "The event the modal emits if you click the close button, silently ignored if show close button is not set"
  prop(close_button_event, :event)

  slot(default, required: true)
  slot(footer, required: true)

  def render(assigns) do
    ~F"""
    <div class={"modal", "is-active": @show}>
      <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">
              {@title}
            </p>
          </header>
          <section class="modal-card-body">
            <#slot/>
          </section>
          <footer class="modal-card-foot is-justify-content-flex-end">
            <#slot name="footer" />
          </footer>
        </div>
    </div>
    """
  end
end
