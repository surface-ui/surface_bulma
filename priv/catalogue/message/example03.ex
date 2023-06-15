defmodule SurfaceBulma.Catalogue.Message.Example03 do
  @moduledoc """
  A closable message component
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Message,
    catalogue: SurfaceBulma.Catalogue,
    height: "600px",
    title: "Message component (close button override)"

  alias SurfaceBulma.Message

  def render(assigns) do
    ~F"""
    <Message id="example03" aria_close_label="override" closable>
      <Message.Header>
        This is the header
      </Message.Header>
      <p>This is the message body</p>
    </Message>
    """
  end
end
