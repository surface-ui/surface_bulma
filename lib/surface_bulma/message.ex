defmodule SurfaceBulma.Message do
  use Surface.LiveComponent

  @moduledoc """
  Colored message blocks, to emphasize part of your page.

  [Bulma Docs - Card](https://bulma.io/documentation/components/message/)
  """

  use SurfaceBulma.ColorProp

  use SurfaceBulma.SizeProp

  @doc "When used with a header, close button embedded in header"
  prop closable, :boolean, default: false

  @doc "Custom ARIA label for close button"
  prop aria_close_label, :string

  @doc "Additional CSS for container"
  prop container_class, :css_class

  @doc "Additional CSS for header"
  prop header_class, :css_class

  @doc "Additional CSS for close button"
  prop close_class, :css_class

  @doc "Additional CSS for body"
  prop body_class, :css_class

  @doc "Current open/close state"
  data show, :boolean, default: true

  @doc "Content for the main part of the component"
  slot default, required: true

  @doc "Message header that can hold a title and a delete element"
  slot header_content

  def render(assigns) do
    ~F"""
    <div>
      <article
        :if={@show}
        class={"message", @container_class, "is-#{@color}": @color, "is-#{@size}": @size}
      >
        <header :if={slot_assigned?(:header_content)} class={"message-header", @header_class}>
          <#slot {@header_content} />
          <button
            :if={@closable}
            :on-click="close"
            class={"delete", @close_class}
            aria-label={@aria_close_label}
          />
        </header>
        <div class={"message-body", @body_class}>
          <#slot />
        </div>
      </article>
    </div>
    """
  end

  def handle_event("close", _value, socket) do
    {:noreply, assign(socket, :show, false)}
  end
end
