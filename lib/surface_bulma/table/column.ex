defmodule SurfaceBulma.Table.Column do
  @moduledoc """
  Defines a column for the parent table component.

  The column instance is automatically added to the table's
  `cols` slot.
  """

  use Surface.Component, slot: "cols"

  @doc "Column header text"
  prop label, :string, required: true

  prop show, :boolean, default: true

  @doc """
  This prop takes a sort field, the following values are valid:
  - A string that is a valid field on the table, or a list of selectors to access nested data. If element of list is binary or atom, `Map.get` is used, if it is an integer, `Enum.at` is used.
  - A function of arity 1 (uses default sorter)
  - A tuple of {sorter_function/1, compare_function/2}
  - A tuple of {list_of_selectors, compare_function/2}. The list of selectors is the same as described above.
  All three options are sent as-is to Enum.sort_by/3

  If function it will be used as such:
  ```
  Enum.sort_by(data, sorter_function)
  ```

  Clicking the column again will simply reverse the sort, after
  using the same sorter function whether it is a prop sorter or
  function sorter.

  To do compound sorts based on for example .name and .last_name,
  you would supply a function like this:
  ```
  fn i -> {Map.get(i, :name), Map.get(i, :last_name)} end
  ```
  This would sort the data by first name first, then last name.

  If you need to sort things that do not compare properly with the
  built in `<=` etc, then you can supply a sorter function. For dates
  you would most likely want to supply the following tuple:
  ```
  {fn i -> Map.get(i, :datefield) end, &Date.compare/2}
  ```
  """
  prop sort_by, :any, default: nil

  # Todo, requires patching of bulma css
  # prop width, :string, default: nil
end
