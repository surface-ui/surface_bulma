defmodule SurfaceBulma.Catalogue.Dropdown.Example02 do
  @moduledoc """
  Example of hoverable
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Dropdown,
    catalogue: SurfaceBulma.Catalogue,
    height: "480px",
    title: "Hoverable"

  alias SurfaceBulma.Dropdown
  alias SurfaceBulma.Icon

  def render(assigns) do
    ~F"""
    <Dropdown id="example02" hoverable>
      <Dropdown.CurrentItem>Current Item</Dropdown.CurrentItem>
      <Dropdown.LinkItem to="#hi"><Icon.FontAwesome icon="camera" />Item 1</Dropdown.LinkItem>
      <Dropdown.LinkItem to="#there"><Icon.FontAwesome icon="fingerprint" />Item 2</Dropdown.LinkItem>
      <Dropdown.LinkItem to="#from"><Icon.FontAwesome icon="flag" />Item 3</Dropdown.LinkItem>
      <Dropdown.Divider />
      <Dropdown.ContentItem>
        <p>You can insert <strong>any type of content</strong> within the dropdown menu.</p>
      </Dropdown.ContentItem>
    </Dropdown>
    """
  end
end