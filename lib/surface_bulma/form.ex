defmodule SurfaceBulma.Form do
  @moduledoc """
  The form component that wraps the inputs.
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form

  include(Form)

  slot default, arg: %{form: :form}

  defdelegate render(assigns), to: Surface.Components.Form
  # def render(assigns) do
  #   ~F"""
  #   <Form {...included_props(assigns)} :let={form}>
  #     <Context put={__MODULE__, form: form}>
  #       <#slot {@default, form: form} context_put={__MODULE__, form: form} />
  #     </Context>
  #   </Form>
  #   """
  # end
end
