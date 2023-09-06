defmodule SurfaceBulma.TabUtils do
  @moduledoc false

  # TODO make this dependent on the version of LiveView used. It would be preferable to use JS commands instead of a LiveComponent.
  defmacro __using__(opts \\ []) do
    moduledoc =
      Keyword.get(opts, :doc, "") <>
        """

        Tab selection is handled by an internal event when Phoenix LiveView version < 0.17.* is used.
        A custom event can be specified for a tab, but be aware that the event handler has to send an update to the 
        component containing the tab. 

        For example given this markup:

        ```jsx
          ~F\"\"\"
            <Panel id="mypanel">
              <:title>Test Panel</:title>
              <Tab title="first">
                <TabItem>Item</TabItem>
              </Tab>
              <Tab title="special" click="my-event">
                <TabItem>SpecialItem</TabItem>
              </Tab>
            </Panel>
          \"\"\"
        ```

        The parent LiveView or LiveComponent needs to call `Panel.set_tab/2` to tell the `Panel` that the selected tab has changed.
        The event handler would then look like this:
        ```
        def handle_event("my-event", %{"index" => index_str}, socket) do
          ... do some other things ...
          Panel.set_tab("mypanel", String.to_integer(index_str))
        end

        """

    quote do
      @moduledoc unquote(moduledoc)
      use Surface.LiveComponent
      alias SurfaceBulma.TabsRow
      import SurfaceUtils

      data active_tab_index, :integer

      data set_active_tab, :integer

      data animation, :string, default: ""

      def update(%{set_active_tab: set_active_tab} = assigns, socket) do
        socket =
          socket
          |> assign(assigns)
          |> assign(:active_tab_index, set_active_tab)
          |> assign(:set_active_tab, nil)

        {:ok, socket}
      end

      def update(%{tabs: tabs} = assigns, socket) do
        socket =
          socket
          |> assign(assigns)
          |> assign_new(:active_tab_index, fn -> Enum.find_index(tabs, & &1.visible) end)

        {:ok, socket}
      end

      def update(assigns, socket) do
        {:ok, assign(socket, assigns)}
      end

      def set_tab(id, index) do
        send_update(unquote(__CALLER__.module), id: id, set_active_tab: index)
      end

      def handle_event("tab_click", %{"index" => index_str}, socket) do
        index = String.to_integer(index_str)
        animation = next_animation(socket.assigns, index)
        {:noreply, assign(socket, active_tab_index: index, animation: animation)}
      end

      defp next_animation(assigns, clicked_index) do
        %{animation: animation, active_tab_index: active_tab_index} = assigns

        cond do
          clicked_index > active_tab_index ->
            "slideInRight"

          clicked_index < active_tab_index ->
            "slideInLeft"

          true ->
            animation
        end
      end
    end
  end
end
