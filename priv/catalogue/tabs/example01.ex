defmodule SurfaceBulma.Catalogue.Tabs.Example01 do
  @moduledoc """
    Example for Tabs component.
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Tabs,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample tabs",
    height: "700px",
    width: "1000px"

  alias SurfaceBulma.{Item, Tab, Tabs, Icon.FontAwesome}

  alias SurfaceBulma.Form.{TextArea, DateSelect}

  def render(assigns) do
    ~F"""
    <Tabs id="my-tabs">
      <Tab label="Your birthday" icon="calendar">
        <DateSelect label="Birthday date" field={:example_01_birthday} />
      </Tab>
      <Tab label="Desired gifts" icon="gift">
        <TextArea label="Gifts:" field={:example_01_gifts} />
      </Tab>
    </Tabs>
    """
  end
end
