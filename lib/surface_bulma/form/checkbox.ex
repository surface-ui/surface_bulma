defmodule SurfaceBulma.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """

  use Surface.Components.Form.Input

  alias Surface.Components.Form.{Field, Checkbox}

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    checkbox_props = Enum.reduce(__MODULE__.__props__(), %{}, fn %{name: name}, acc -> Map.put(acc, name, assigns[name]) end)
    ~F"""
      <Field class="field" name={@field}>
        <div class="control">
          <label class="checkbox">
            <Checkbox
              opts={[disabled: @disabled] ++ @opts }
              {...checkbox_props}
              />
            <#slot/>
          </label>
        </div>
      </Field>
    """
  end
end
