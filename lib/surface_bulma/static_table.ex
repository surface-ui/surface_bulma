defmodule SurfaceBulma.StaticTable do
  @moduledoc """
  A static Bulma HTML table.

  You can create a table by passing `data` to it and defining
  columns using the `Table.Column` component.
  """

  use Surface.Component

  @doc "The data that populates the table internal"
  prop data, :generator, required: true, root: true

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
  slot cols, generator_prop: :data, required: true

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
            {#for col <- @cols, col.show == true}
              <th>
                {col.label}
              </th>
            {/for}
          </tr>
        </thead>
        <tbody>
          <tr
            :for={{item, index} <- Enum.with_index(@data)}
            class={row_class_fun(@row_class).(item, index)}
          >
            <td :for={col <- @cols, col.show == true}>
              <span><#slot {col} generator_value={item} /></span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  defp row_class_fun(nil), do: fn _, _ -> "" end
  defp row_class_fun(row_class), do: row_class
end
