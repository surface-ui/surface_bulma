defmodule SurfaceBulma.Footer do
  @moduledoc """
  The classic **button**, in different colors, sizes, and states
  """

  use Surface.Component

  @doc "The label of the button, when no content (default slot) is provided"
  prop label, :string

  @doc "Css classes to propagate down to button. Default class if no class supplied is simply _button_"
  prop class, :css_class, default: []

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~F"""
      <footer class={"footer", @class}>
        <div class="content has-text-centered">
          <p>
           <#slot />
          </p>
        </div>
      </footer>
    """
  end
end
