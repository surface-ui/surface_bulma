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

  defmodule ClassProp do
    @moduledoc false
    defmacro __using__(opts \\ []) do
      default = opts[:default]

      doc =
        opts[:doc] ||
          "Additional CSS classes#{(default && ", default is: #{inspect(default)}") || ""}"

      quote bind_quoted: [default: default, doc: doc] do
        import SurfaceBulma, only: [classes: 1, classes: 2]
        @doc doc
        prop class, :css_class, default: default
      end
    end
  end

  defmodule ContextClass do
    @moduledoc false
    defmacro __using__(_) do
      quote do
        import SurfaceBulma, only: [classes: 1, classes: 2]
        @doc false
        data context_class, :css_class, from_context: {unquote(__CALLER__.module), :context_class}
      end
    end
  end

  def classes(assigns, classes \\ []) do
    context_class = normalize_class(assigns[:context_class])
    class = normalize_class(assigns[:class])
    classes = normalize_class(classes)
    class ++ context_class ++ classes
  end

  defp normalize_class(class) do
    cond do
      is_binary(class) ->
        [{class, true}]

      is_list(class) ->
        class

      true ->
        []
    end
  end
end
