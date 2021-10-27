defmodule SurfaceBulma.Form do
  @moduledoc """
  The form component that wraps the inputs.
  """
  use SurfaceBulma.Component
  alias Surface.Components.Form

  include(Form)

  slot default, args: [:form]

  def render(assigns) do
    ~F"""

    <Form {...included_props(assigns)} :let={form: form}>
      <Context put={__MODULE__, form: form}>
        <#slot :args={form: form} />
      </Context>
    </Form>
    """
  end
end
