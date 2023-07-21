defmodule SurfaceBulma.Catalogue.Panel.Example01 do
  @moduledoc false

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Panel,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample navbar",
    height: "700px",
    width: "1000px"

  alias SurfaceBulma.Panel
  alias SurfaceBulma.Panel.Header
  alias SurfaceBulma.Tab

  alias SurfaceBulma.Form.TextInput

  def render(assigns) do
    ~F"""
    <Panel id="my-panel" color="primary">
      <:title>A primary panel</:title>
      <Header>This is a header</Header>
      <Tab label="First Tab">
        <TextInput field={:example_01_dummy} />
      </Tab>
      <Tab label="Second Tab" icon="calendar">
        <TextInput field={:example_01_dummy} />
      </Tab>
    </Panel>
    """
  end
end
