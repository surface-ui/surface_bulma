defmodule SurfaceBulma.Catalogue.Dropdown.Playground do
  @moduledoc ""
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Dropdown,
    catalogue: SurfaceBulma.Catalogue,
    height: "200px",
    width: "200px",
    vertical: false,
    body: [style: "padding: 1.5rem; display: flex; justify-content: center; align-items: center;"]

  alias SurfaceBulma.Icon
  alias SurfaceBulma.Link

  @props [
    id: "playground_dropdown"
  ]

  @slots [
    trigger: "Click me!"
  ]

  def render(assigns) do
    ~F"""
    <Dropdown {...@props}>
      <:trigger>{@slots[:trigger]}</:trigger>
      <Link href="#">Link Item</Link>
      <SurfaceBulma.Item>
        <ul>
          <li><span><Icon.FontAwesome icon="check" /></span>
            - Arbitrary Content</li>
          <li><span><Icon.FontAwesome icon="trash" /></span>
            - Arbitrary Content</li>
        </ul>
        <p>
          Ullamco duis esse tempor dolor fugiat nisi Lorem dolore esse ipsum nulla elit.
        </p>
      </SurfaceBulma.Item>
    </Dropdown>
    """
  end
end
