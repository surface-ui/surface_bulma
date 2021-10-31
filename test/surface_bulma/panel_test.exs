defmodule SurfaceBulma.PanelTest do
  use SurfaceBulma.ConnCase

  alias SurfaceBulma.Panel
  alias SurfaceBulma.Panel.{Header, Tab}

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

  test "tabs can be set" do
    html =
      render_surface do
        ~F"""
          <Panel id="panel">
            <Tab title="Tab 1">
              <Tab.TabItem type="input"><input /></Tab.TabItem>
              <Tab.TabItem type="link" href="example.com">a link</Tab.TabItem>
              <Tab.TabItem>Tabitem 1.3</Tab.TabItem>
            </Tab>
          </Panel>
        """
      end

    assert html =~ """
           <nav class="panel">
             <p class="panel-heading">
             </p>
             <p class="panel-tabs">
                 <a phx-click="tab_click" phx-target="1" class="is-active" phx-value-index="0">
                   Tab 1
                 </a>
             </p>
                 <div class="panel-block">
                   <div class="control">
                     <input>
                   </div>
                 </div>
                 <a class="panel-block">
                   a link
                 </a>
                 <div class="panel-block">
                   Tabitem 1.3
                 </div>
           </nav>
           """
  end

  defmodule View do
    use Surface.LiveView
    alias SurfaceBulma.Panel
    alias SurfaceBulma.Panel.Tab

    def render(assigns) do
      ~F"""
        <Panel id="panel">
          <Tab title="Tab 1">
            <Tab.TabItem type="input"><input /></Tab.TabItem>
            <Tab.TabItem type="link" href="example.com">a link</Tab.TabItem>
            <Tab.TabItem>Tabitem 1.3</Tab.TabItem>
          </Tab>
          <Tab title="Tab 2">
            <Tab.TabItem>Tabitem 2</Tab.TabItem>
          </Tab>
        </Panel>
      """
    end
  end

  test "clicking on a tab will switch to the other tab" do
    {:ok, view, _html} = live_isolated(build_conn(), View)

    assert view
           |> element(".panel-tabs a:nth-child(1)")
           |> render() =~ "Tab 1"

    view
    |> element(".panel-tabs a:nth-child(2)")
    |> render_click()

    assert view
           |> element(".panel-tabs a:nth-child(2).is-active")
           |> render() =~ "Tab 2"

    assert view
           |> element(".panel-block")
           |> render() =~ "Tabitem 2"
  end
end
