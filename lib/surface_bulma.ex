defmodule SurfaceBulma do
  @moduledoc """
  This component library is a work in progress that aims to implement the Bulma framework is Surface.
  """
  defmodule ColorProp do
    @moduledoc false
    defmacro __using__(component_doc_name) do
      component_doc_name =
        if component_doc_name != [] do
          component_doc_name
        else
          Module.split(__CALLER__.module) |> List.last() |> String.downcase()
        end

      quote do
        @doc "The color of the #{unquote(component_doc_name)}."
        prop color, :string,
          values: ~w(white black light dark primary link info success warning danger)
      end
    end
  end
end
