defmodule SurfaceBulma.Form.FieldWrapper do
  @moduledoc """
  Used to double-wrap fields in some usage patterns for fields in horizontal forms.

  https://bulma.io/documentation/elements/button/#list-of-buttons
  """
  use Surface.Component

  @doc "Are buttons attached to eachother?"
  prop expanded, :boolean

  @doc "Help text, will wrap outside internal field and not be removed by error text"
  prop help_text, :string

  slot default

  def render(assigns) do
    ~H"""
    <div class={{"field", "is-expanded": @expanded}}>
    <slot/>
    <span :if={{@help_text}} class="help">{{@help_text}}</span>
    </div>
    """
  end
end
