defmodule SurfaceBulma.Catalogue.Dropdown.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Dropdown,
    catalogue: SurfaceBulma.Catalogue,
    height: "600px",
    body: [style: "padding: 1.5rem; display: flex; justify-content: center; align-items: center;"]

  alias SurfaceBulma.Icon

  data props, :map, default: %{
    id: "playground_dropdown",
    current_item: "Current Item",
  }

  def render(assigns) do
    ~F"""
    <Dropdown {...@props}>
      <Dropdown.CurrentItem>{@props.current_item}</Dropdown.CurrentItem>
      <Dropdown.LinkItem to="#">Link Item</Dropdown.LinkItem>
      <Dropdown.ContentItem>
        <ul>
          <li><span><Icon.FontAwesome icon="check"/></span> - Arbitrary Content</li>
          <li><span><Icon.FontAwesome icon="trash"/></span> - Arbitrary Content</li>
        </ul>
        <p>
          Ullamco duis esse tempor dolor fugiat nisi Lorem dolore esse ipsum nulla elit.
        </p>
      </Dropdown.ContentItem>
    </Dropdown>
    """
  end
end
