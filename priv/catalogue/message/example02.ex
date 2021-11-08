defmodule SurfaceBulma.Catalogue.Message.Example02 do
  @moduledoc """
  A closable message component
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Message,
    catalogue: SurfaceBulma.Catalogue,
    height: "600px",
    title: "Basic message component (closable)"

  alias SurfaceBulma.Message
  alias SurfaceBulma.Icon

  def render(assigns) do
    ~F"""
    <Message id="example02" closable>
      <Message.Header>
        This is the header
      </Message.Header>

      <p>This is the message body</p>
    </Message>
    """
  end
end
