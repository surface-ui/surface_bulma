defmodule SurfaceBulma.Form do
  use SurfaceBulma.Component
  alias Surface.Components.Form

  @moduledoc """
  Form components, Bulma style
  """

  include(Surface.Components.Form)

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
    if is_map(form.source) do
      Ecto.Changeset.get_change(form.source, field, false)
    else
      false
    end
  end

  def render(assigns) do
    ~F"""
      <Form {...included_props(assigns)}>
        <Context get={form: form}>
          <#slot :args={form: form}/>
        </Context>
      </Form>
    """
  end
end
