defmodule SurfaceBulma.Form do
  use Surface.Component
  alias Surface.Components.Form

  @moduledoc """
  Form components, Bulma style
  """

  for prop <- Form.__props__() do
    Module.put_attribute(__MODULE__, :props, prop)
    Module.put_attribute(__MODULE__, :assigns, prop)
  end

  @doc "The content of the `<form>`"
  slot default, args: [:form]

  @doc "Helper function used by the form controls"
  def field_has_error?(form, field) do
    Enum.any?(form.errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  @doc "Helper function used by the form controls"
  def field_has_change?(form, field) do
    Ecto.Changeset.get_change(form.source, field, false)
  end

    def render(assigns) do
      form_props = Enum.reduce(__MODULE__.__assigns__(), %{}, fn {k, v}, acc -> Map.put(acc, k, v) end)
    ~F"""
      <Form {...form_props}>
        <#slot />
      </Form>
    """
  end
end
