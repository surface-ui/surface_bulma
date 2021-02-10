defmodule SurfaceBulma.Catalogue.Table.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Table,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sortable prop columns",
    height: "300px"

  alias SurfaceBulma.Table
  alias SurfaceBulma.Table.Column

  data props, :map,
    default: %{
      data: [
        %{id: 1, name: "John"},
        %{id: 2, name: "Jane"},
        %{id: 3, name: "Albert"},
        %{id: 4, name: "Diana"},
        %{id: 5, name: "Elizabeth"}
      ]
    }

  def render(assigns) do
    ~H"""
    <Table id="foo" data={{ person <- @props.data }} :props={{ @props }}>
      <Column label="Id" sort_by="id">
        {{ person.id }}
      </Column>
      <Column label="Name" sort_by="name">
      {{ person.name }}
      </Column>
    </Table>
    """
  end
end
