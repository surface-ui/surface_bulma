defmodule Surface.Components.TableTest do
  use ExUnit.Case, async: true

  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  @endpoint Endpoint

  defmodule View do
    use Surface.LiveView

    alias SurfaceBulma.Table
    alias SurfaceBulma.Table.Column

    def render(assigns) do
      data = [
        %{id: 1, name: "John"},
        %{id: 2, name: "Jane"}
      ]

      ~H"""
      <Table data={{ person <- data }}>
        <Column label="Id">
          {{ person.id }}
        </Column>
        <Column label="Name">
          {{ person.name }}
        </Column>
      </Table>
      """
    end
  end

  setup do
    {:ok, view, _html} = live_isolated(build_conn(), View)
    %{view: view}
  end

  test "generates a table with class table", %{view: view} do
    assert view
           |> element("table[class*=table]")
           |> has_element?()
  end

  test "the header shows the labels of the columns", %{view: view} do
    head_row = "table thead tr:nth-child(1)"

    assert view
           |> element("#{head_row} th:nth-child(1)")
           |> render() =~ "Id"

    assert view
           |> element("#{head_row} th:nth-child(2)")
           |> render() =~ "Name"
  end

  test "the body shows each item of the data in a row", %{view: view} do
    row1 = "table tbody tr:nth-child(1)"

    assert view
           |> element("#{row1} td:nth-child(1)")
           |> render() =~ "1"

    assert view
           |> element("#{row1} td:nth-child(2)")
           |> render() =~ "John"

    row2 = "table tbody tr:nth-child(2)"

    assert view
           |> element("#{row2} td:nth-child(1)")
           |> render() =~ "2"

    assert view
           |> element("#{row2} td:nth-child(2)")
           |> render() =~ "Jane"
  end
end
