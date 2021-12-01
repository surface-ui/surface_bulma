defmodule SurfaceBulma.Catalogue.Message.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Message,
    catalogue: SurfaceBulma.Catalogue,
    height: "600px",
    body: [style: "padding: 1.5rem;"]

  data props, :map, default: %{
    id: "playground_message",
    closable: false,
    color: "dark",
    size: "medium",
  }

  def render(assigns) do
    ~F"""
    <h2 style="font-size: 1.4rem; font-weight: bold; padding: 1rem 0;">With Header</h2>
    <Message {...@props} id="playground01">
      <Message.Header>This is the header</Message.Header>
      <p>Anim sit do tempor eu reprehenderit magna nostrud cupidatat ut tempor qui. Commodo adipisicing anim nulla deserunt minim voluptate ipsum quis. Amet sint irure dolore commodo commodo enim.</p>
    </Message>
    <h2 style="font-size: 1.4rem; font-weight: bold; padding: 1rem 0;">Without header</h2>
    <Message {...@props} id="playground02">
      <p>No header variant</p>
      <p>Anim sit do tempor eu reprehenderit magna nostrud cupidatat ut tempor qui. Commodo adipisicing anim nulla deserunt minim voluptate ipsum quis. Amet sint irure dolore commodo commodo enim.</p>
    </Message>
    """
  end
end
