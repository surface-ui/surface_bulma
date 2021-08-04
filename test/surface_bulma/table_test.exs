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
          %{id: 1, name: "John", address: %{street: "a street", residents: []}},
          %{id: 2, name: "Jane", address: %{street: "b street", residents: ["Zita"]}},
          %{id: 3, name: "Albert", address: %{street: "c street", residents: []}},
          %{id: 4, name: "Diana", address: %{street: "d street", residents: []}},
          %{id: 5, name: "Elizabeth", address: %{street: "e street", residents: ["Raymond"]}}
        ]
      }

    def render(assigns) do
      ~F"""
      <Table id="foo" data={person <- @props.data} :props={@props}>
        <Column label="Id" sort_by="id">
          {person.id}
        </Column>
        <Column label="Name" sort_by="name">
        {person.name}
        </Column>
        <Column label="Street" sort_by={[:address, :street]}>
          {person.address.street}
        </Column>
        <Column label="Residents" sort_by={{[:address, :residents, 0], &Kernel.>=/2}}>
          {person.address.residents |> Enum.join(", ")}
        </Column>
      </Table>
      """
    end
  end

  describe "static tables are rendered and sorted correctly" do
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

    test "sorting columns that access nested keys should work", %{view: view} do
      view
      |> element("table thead tr th:nth-child(3) a")
      |> render_click()

      assert view
             |> element("table tr:nth-child(1) td:nth-child(2)")
             |> render() =~ "John"

      view
      |> element("table thead tr th:nth-child(3) a")
      |> render_click()

      assert view
             |> element("table tr:nth-child(1) td:nth-child(2)")
             |> render() =~ "Elizabeth"

      # sort by residents 
      view
      |> element("table thead tr th:nth-child(4) a")
      |> render_click()

      assert view
             |> element("table tr:nth-child(1) td:nth-child(2)")
             |> render() =~ "Jane"
    end
  end

  describe "Tables can be updated and sorted again" do
    defmodule UpdateTableView do
      use Surface.LiveView

      alias SurfaceBulma.Table

      data users, :list

      @impl true
      def mount(_params, _session, socket) do
        {:ok, assign(socket, :users, [%{name: "John", age: 9}])}
      end

      @impl true
      def render(assigns) do
        ~F"""
        <Table data={user <- @users} id="1">
            <Table.Column label="name">{ user.name }</Table.Column>
            <Table.Column label="age" sort_by="age">{ user.age }</Table.Column>
        </Table>
        """
      end

      @impl true
      def handle_info({:add_user, user}, socket) do
        users = [user | socket.assigns.users]

        {:noreply, assign(socket, users: users)}
      end

      def add_user(pid, name, age) do
        send(pid, {:add_user, %{name: name, age: age}})
      end
    end

    setup do
      {:ok, view, _html} = live_isolated(build_conn(), UpdateTableView)
      %{view: view}
    end

    test "updating normal table", %{view: view} do
      view
      |> element("table tr:nth-child(1) td:nth-child(1)")
      |> render() =~ "John"

      UpdateTableView.add_user(view.pid, "Jim", 10)

      view
      |> element("table tr:nth-child(2) td:nth-child(1)")
      |> render() =~ "Jim"
    end

    test "updating sorted normal table", %{view: view} do
      # sort ascending by age
      view
      |> element("table thead tr th:nth-child(2) a")
      |> render_click()

      view
      |> element("table tr:nth-child(1) td:nth-child(1)")
      |> render() =~ "John"

      # add a younger user which should be the first row now
      UpdateTableView.add_user(view.pid, "Jim", 8)

      view
      |> element("table tr:nth-child(1) td:nth-child(1)")
      |> render() =~ "Jim"
    end
  end
end
