defmodule Surface.Components.TableTest do
  use ExUnit.Case, async: true

  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  @endpoint Endpoint

  defmodule View do
    use Surface.LiveView

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
      <Table id="foo" data={person <- @props.data} :props={@props}>
        <Column label="Id" sort_by="id">
          {person.id}
        </Column>
        <Column label="Name"sort_by="name">
        {person.name}
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

  test "sorting should work in all directions", %{view: view} do
    row1 = "table tbody tr:nth-child(1)"
    row5 = "table tbody tr:nth-child(5)"

    assert view
           |> element("#{row1} td:nth-child(2)")
           |> render() =~ "John"

    assert view
           |> element("#{row5} td:nth-child(2)")
           |> render() =~ "Elizabeth"

    # Ensure albert goes to the top
    view
    |> element("table thead tr th:nth-child(2) a")
    |> render_click()

    assert view
           |> element("#{row1} td:nth-child(2) span")
           |> render() =~ "Albert"

    # then to the bottom
    view
    |> element("table thead tr th:nth-child(2) a")
    |> render_click()

    assert view
           |> element("#{row5} td:nth-child(2) span")
           |> render() =~ "Albert"

    # then to the top again
    view
    |> element("table thead tr th:nth-child(2) a")
    |> render_click()

    assert view
           |> element("#{row1} td:nth-child(2) span")
           |> render() =~ "Albert"

    # check that id sorting works as well
    view
    |> element("table thead tr th:nth-child(1) a")
    |> render_click()

    assert view
           |> element("#{row1} td:nth-child(1) span")
           |> render() =~ "1"

    assert view
           |> element("#{row5} td:nth-child(1) span")
           |> render() =~ "5"

    view
    |> element("table thead tr th:nth-child(1) a")
    |> render_click()

    assert view
           |> element("#{row1} td:nth-child(1) span")
           |> render() =~ "5"

    assert view
           |> element("#{row5} td:nth-child(1) span")
           |> render() =~ "1"
  end
end
