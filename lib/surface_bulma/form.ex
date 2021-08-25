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
    field = normalize_field(field)
    Enum.any?(form.errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  @doc "Helper function used by the form controls"
  def field_has_change?(form, field) do
    field = normalize_field(field)
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

  defp normalize_field(field)
  defp normalize_field(field) when is_atom(field), do: String.to_atom(field)
  defp normalize_field(field) when is_binary(field), do: field
  defp normalize_field(_field) do
    raise "Field should be atom or binary"
  end
end
