defmodule SurfaceBulma.Table do
  @moduledoc """
  A Bulma HTML table.

  You can create a table by passing `data` to it and defining
  columns using the `Table.Column` component.

  Look in the documentation for `Table.Column` for information on how to do sorting.
  """

  use Surface.LiveComponent
  alias SurfaceBulma.Icon.FontAwesome, as: FA
  alias SurfaceBulma.Icon.FontAwesome.{TextIcon, TextIconText}

  @doc "The data that populates the table internal"
  prop data, :list, required: true

  @doc "The table is expanded (full-width)"
  prop expanded, :boolean, default: true

  @doc "Add borders to all the cells"
  prop bordered, :boolean, default: false

  @doc "Add stripes to the table"
  prop striped, :boolean, default: false

  @doc "The CSS class for the wrapping `<div>` element"
  prop class, :css_class

  @doc """
  A function that returns a class for the item's underlying `<tr>`
  element. The function receives the item and index related to
  the row.
  """
  prop row_class, :fun

  @doc "The columns of the table"
  slot cols, args: [item: ^data], required: true

  @doc "Internal holder of sorted data"
  data sorted_data, :list, default: nil

  @doc "Holder of what we're sorting by"
  data sorted_by, :any, default: nil

  @doc "Clicking column again should reverse search"
  data sort_reverse, :boolean, default: false

  def update(assigns, socket) do
    socket = assign(socket, assigns)
    socket = assign(socket, :sorted_data, sorted_data(socket.assigns))

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class={@class}>
      <table class={
        :table,
        "is-fullwidth": @expanded,
        "is-bordered": @bordered,
        "is-striped": @striped
      }>
        <thead>
          <tr>
            {#for col <- @cols}
              <th>
              {#if !is_nil(col.sort_by) && assigns.sorted_by == col.sort_by}
              <a :on-click="sorted_click" phx-value-value={col.label} href="#">
                <TextIcon>
                <TextIconText>
                {col.label}
                </TextIconText>
                <FA icon={if assigns.sort_reverse, do: "caret-up", else: "caret-down"}/>
                </TextIcon>
              </a>
              {/if}
              {#if !is_nil(col.sort_by) && assigns.sorted_by != col.sort_by}
              <a :on-click="sorted_click" phx-value-value={col.label} href="#">
              {col.label}
              </a>
              {/if}
              {#if is_nil(col.sort_by)}
              {col.label}
              {/if}
              </th>
            {/for}
          </tr>
        </thead>
        <tbody>
          <tr
            :for={{item, index} <- Enum.with_index(@sorted_data)}
            class={row_class_fun(@row_class).(item, index)}>
            <td :for.index={index <- @cols}>
              <span><#slot name="cols" index={index} :args={item: item}/></span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  def handle_event(
        "sorted_click",
        %{"value" => sort_by_new},
        socket = %{assigns: %{sorted_by: sorted_by, sort_reverse: sort_reverse}}
      ) do
    socket =
      cond do
        sorted_by != sort_by_new ->
          assign(socket, :sorted_by, sort_by_new)
          |> assign(:sort_reverse, false)

        sorted_by == sort_by_new ->
          assign(socket, :sort_reverse, !sort_reverse)
      end

    socket = assign(socket, :sorted_data, sorted_data(socket.assigns))
    {:noreply, socket}
  end

  defp sorted_data(%{
         sorted_by: sorted_by,
         data: data,
         cols: cols,
         sorted_data: sorted_data,
         sort_reverse: sort_reverse
       }) do
    cond do
      !is_nil(sorted_by) ->
        # We find the column that matches the sorted_by assign and extract the sort_by as sorter
        sorter =
          Enum.reduce_while(cols, nil, fn
            %{label: ^sorted_by, sort_by: sorter}, _acc ->
              {:halt, sorter}

            _col, acc ->
              {:cont, acc}
          end)

        sorted_data =
          case sorter do
            sorter when is_binary(sorter) ->
              # We have to try to fetch both by string and atom key as
              # we don't know if the data is using string or atom keys.
              Enum.sort_by(data, fn i ->
                Map.get(i, sorter) || Map.get(i, String.to_atom(sorter))
              end)

            sorter when is_function(sorter) ->
              Enum.sort_by(data, sorter)

            {sorter, comparer} when is_function(sorter) and is_function(comparer) ->
              Enum.sort_by(data, sorter, comparer)

            nil ->
              data
          end

        sorted_data =
          if sort_reverse == true do
            Enum.reverse(sorted_data)
          else
            sorted_data
          end

        sorted_data

      is_nil(sorted_data) ->
        data

      true ->
        sorted_data
    end
  end

  defp row_class_fun(nil), do: fn _, _ -> "" end
  defp row_class_fun(row_class), do: row_class
end
