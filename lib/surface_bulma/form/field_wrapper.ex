defmodule SurfaceBulma.Form.FieldWrapper do
  @moduledoc """
  Used to double-wrap fields in some usage patterns for fields in horizontal forms.

  https://bulma.io/documentation/elements/button/#list-of-buttons
  """
  use SurfaceBulma.Component

  @doc "Are buttons attached to each other?"
  prop expanded, :boolean

  @doc "Help text, will wrap outside internal field and not be removed by error text"
  prop help_text, :string

  slot default

  def render(assigns) do
    ~F"""
    <div class={"field", "is-expanded": @expanded}>
    <#slot/>
    <span :if={@help_text} class="help">{@help_text}</span>
    </div>
    """
  end
end
