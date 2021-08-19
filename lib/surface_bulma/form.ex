defmodule SurfaceBulma.Form do
  use Surface.Component
  alias Surface.Components.Form

  @moduledoc """
  Form components, Bulma style
  """

  for prop <- Surface.Components.Form.__props__() do
    Module.put_attribute(__MODULE__, :prop, prop)
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
    form_props = Enum.reduce(__MODULE__.__props__(), %{}, fn %{name: name}, acc -> Map.put(acc, name, assigns[name]) end)
    ~F"""
      <Form {...form_props}>
        <Context get={form: form}>
          <#slot :args={form: form}/>
        </Context>
      </Form>
    """
  end
end
