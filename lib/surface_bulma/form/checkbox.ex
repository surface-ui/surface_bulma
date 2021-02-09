defmodule SurfaceBulma.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Checkbox}

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Any opts you want to pass on to internal `Surface.Checkbox` and `Phoenix.HTML.Form.checkbox/3`"
  prop opts, :keyword, default: []

  @doc "Class to apply to input"
  prop class, :css_class, default: []

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    ~H"""
      <Field class="field" name={{@field}}>
      <div class="control">
        <label class="checkbox">
          <Checkbox
            field={{@field}}
            opts={{ [disabled: @disabled] ++ @opts  }}
            class={{@class}}
            />
          <slot/>
        </label>
      </div>
      </Field>
    """
  end
end
