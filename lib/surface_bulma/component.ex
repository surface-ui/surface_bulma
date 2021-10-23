defmodule SurfaceBulma.Component do
  defmacro __using__(_) do
    quote do
      use Surface.Component
      import SurfaceBulma.Component, only: [include: 1, include: 2]
    end
  end

  @doc """
  Allows a component to include props from another component.
  Props can be selectively included similarly to Elixir's `import` using `only: [list_of_names]` and `except: [list_of_names]`.
  """
  defmacro include(other_component, opts \\ []) do
    only = Keyword.get(opts, :only)
    except = Keyword.get(opts, :except)

    if is_list(only) and is_list(except) do
      raise "Cannot use only and except together."
    end

    filter =
      cond do
        is_list(only) ->
          quote do
            fn props -> Enum.filter(props, &(&1.name in unquote(only))) end
          end

        is_list(except) ->
          quote do
            fn props -> Enum.reject(props, &(&1.name in unquote(except))) end
          end

        true ->
          quote do
            fn props -> props end
          end
      end

    quote do
      for included_prop <-
            unquote(other_component).__props__()
            |> unquote(filter).() do
        Module.put_attribute(__MODULE__, :prop, included_prop)
        Module.put_attribute(__MODULE__, :assigns, included_prop)
      end

      def included_props(assigns) do
        Enum.reduce(unquote(other_component).__props__(), %{}, fn %{name: name}, acc ->
          Map.put(acc, name, assigns[name])
        end)
      end
    end
  end
end
