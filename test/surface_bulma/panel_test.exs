defmodule SurfaceBulma.PanelTest do
  use SurfaceBulma.ConnCase

  alias SurfaceBulma.{Item, Panel}
  alias SurfaceBulma.Panel.Header
  alias SurfaceBulma.Tab

  test "panel title can be set" do
    html =
      render_surface do
        ~F"""
        <Panel id="panel"><:title>Title</:title></Panel>
        """
      end

    assert html =~ """
           <nav class="panel">
             <p class="panel-heading">
               Title
             </p>
           </nav>
           """
  end

  test "panel header can be set" do
    html =
      render_surface do
        ~F"""
        <Panel id="panel">
          <:title>Title</:title>
          <Header>A header</Header>
        </Panel>
        """
      end

    assert html =~ """
           <nav class="panel">
             <p class="panel-heading">
               Title
             </p>
                 <div class="panel-block">
                   A header
                 </div>
           </nav>
           """
  end

  defmodule View do
    use Surface.LiveView
    alias SurfaceBulma.{Item, Panel, Tab}

    def render(assigns) do
      ~F"""
      <Panel id="panel">
        <:title>A panel</:title>
        <Tab label="Tab 1">
          <Item>Tabitem 1</Item>
        </Tab>
        <Tab label="Tab 2">
          <Item>Tabitem 2</Item>
        </Tab>
      </Panel>
      """
    end
  end

  test "clicking on a tab will switch to the other tab" do
    {:ok, view, _html} = live_isolated(build_conn(), View)

    assert view
           |> element(".panel-tabs li:nth-child(1) a")
           |> render() =~ "Tab 1"

    view
    |> element(".panel-tabs li:nth-child(2) a")
    |> render_click()

    assert view
           |> element(".panel-tabs li:nth-child(2).is-active a")
           |> render() =~ "Tab 2"

    assert view
           |> render() =~ "Tabitem 2"

    refute view
           |> render() =~ "Tabitem 1"
  end
end
