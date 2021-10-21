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
  def field_has_error?(%{errors: errors}, field) do
    Enum.any?(errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  def field_has_error?(_not_form, _field), do: false

  @doc "Helper function used by the form controls"
  def field_has_change?(%{source: source}, field) when is_map(source) do
    Ecto.Changeset.get_change(source, field, false)
  end

  def field_has_change?(_not_form, _field), do: false

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
