defmodule SurfaceBulma.Catalogue.Dropdown.Example03 do
  @moduledoc """
  Example using all of the available sub-components.
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Dropdown,
    catalogue: SurfaceBulma.Catalogue,
    height: "480px",
    title: "Active"

  alias SurfaceBulma.Dropdown
  alias SurfaceBulma.Icon
  alias SurfaceBulma.Link

  def render(assigns) do
    ~F"""
    <Dropdown id="example03" active>
      <:trigger>Current Item</:trigger>
      <Link href="#hi"><Icon.FontAwesome icon="camera" />Item 1</Link>
      <Link href="#there"><Icon.FontAwesome icon="fingerprint" />Item 2</Link>
      <Link href="#from"><Icon.FontAwesome icon="flag" />Item 3</Link>
      <SurfaceBulma.Divider />
      <SurfaceBulma.Item>
        <p>You can insert <strong>any type of content</strong> within the dropdown menu.</p>
      </SurfaceBulma.Item>
    </Dropdown>
    """
  end
end
