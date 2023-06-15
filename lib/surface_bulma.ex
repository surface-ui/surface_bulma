defmodule SurfaceBulma do
  @moduledoc """
  This component library is a work in progress that aims to implement the Bulma framework is Surface.
  """

  defmodule SizeProp do
    defmacro __using__(component_doc_name) do
      component_doc_name =
        if component_doc_name != [] do
          component_doc_name
        else
          Module.split(__CALLER__.module) |> List.last() |> String.downcase()
        end

      quote do
        @doc "The color of the #{unquote(component_doc_name)}."
        prop size, :string, values: ~w(small normal medium large)
      end
    end
  end

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

  defmodule ContextClass do
    @moduledoc false
    defmacro __using__(_) do
      quote do
        @doc false
        data context_class, :css_class, from_context: {unquote(__CALLER__.module), :context_class}
      end
    end
  end
end
