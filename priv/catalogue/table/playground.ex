defmodule SurfaceBulma.Catalogue.Table.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBulma.Table,
    catalogue: SurfaceBulma.Catalogue,
    height: "270px",
    body: [class: "has-background-light", style: "padding: 25px;"]

    alias SurfaceBulma.Table.Column

    data props, :map, default: %{
      id: "table",
      bordered: true,
      striped: true,
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
    <Table data={{ person <- @props.data }} :props={{ @props }}>
      <Column label="Id" sort_by="id" style="width: 200px;">
        {{ person.id }}
      </Column>
      <Column label="Name" sort_by="name">
        {{ person.name }}
      </Column>
    </Table>
    """
  end
end
