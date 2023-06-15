defmodule SurfaceBulma.Catalogue.Panel.Playground do
  @moduledoc "A panel to play with"
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Panel,
    # catalogue: SurfaceBulma.Catalogue,
    height: "300px"

  alias SurfaceBulma.{Button, Item, Link, Tab, Panel, Title}

  @props [
    id: "mypanel",
    tabs_class: ["is-small"]
  ]

  @slots [
    title: "A panel",
    tabs: ""
  ]

  def render(assigns) do
    ~F"""
    <Panel {...@props}>
      <:title>A panel</:title>
      <Tab label="Tab1">
        <Link>A Link</Link>
        <Item><Title size="6">Hello</Title></Item>
        <Item><Button expand>This is a button</Button></Item>
      </Tab>
      <Tab label="Tab1">
        <Item>Hello</Item>
      </Tab>
      <Tab label="Tab1">
        <Item>Hello</Item>
      </Tab>
      <Tab label="Tab1">
        <Item>Hello</Item>
      </Tab>
    </Panel>
    """
  end
end
