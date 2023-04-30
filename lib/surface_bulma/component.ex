defmodule SurfaceBulma.Component do
  defmacro __using__(_) do
    quote do
      use Surface.Component
      import SurfaceBulma.Component, only: [include: 1, include: 2, maybe_rename_prop: 2]
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

    names =
      Enum.map(
        (is_list(only) && only) || except || [],
        fn
          {name, _} -> name
          name -> name
        end
      )

    filter =
      cond do
        is_list(only) ->
          quote do
            fn props -> Enum.filter(props, &(&1.name in unquote(names))) end
          end

        is_list(except) ->
          quote do
            fn props -> Enum.reject(props, &(&1.name in unquote(names))) end
          end

        true ->
          quote do
            fn props -> props end
          end
      end

    quote do
      import SurfaceBulma.Component, only: [maybe_rename_prop: 2]

      for included_prop <-
            unquote(other_component).__props__()
            |> unquote(filter).() do
        Module.put_attribute(__MODULE__, :prop, maybe_rename_prop(included_prop, unquote(only)))

        Module.put_attribute(
          __MODULE__,
          :assigns,
          maybe_rename_prop(included_prop, unquote(only))
        )
      end

      def included_props(assigns, unquote(other_component)) do
        Enum.reduce(unquote(other_component).__props__(), %{}, fn %{name: name}, acc ->
          if Map.get(assigns, name) do
            Map.put(acc, name, assigns[name])
          else
            acc
          end
        end)
      end
    end
  end

  def maybe_rename_prop(%{name: name} = prop, included_props) do
    if is_list(included_props[name]) do
      %{prop | name: included_props[name][:as]}
    else
      prop
    end
  end
end
