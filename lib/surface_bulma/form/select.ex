defmodule SurfaceBulma.Form.Select do
  @moduledoc """
  The checkbox component
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Label, Select}

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "The string label of the field"
  prop label, :string

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Any opts you want to pass on to internal `Surface.Checkbox` and `Phoenix.HTML.Form.checkbox/3`"
  prop opts, :keyword, default: []

  @doc "Class to apply to input"
  prop class, :css_class, default: []

  @doc "The select options"
  prop options, :any, default: []

  @doc "The selected value"
  prop selected, :any

  @doc "The prompt (nothing selected yet) string"
  prop prompt, :string

  @doc "Size of select in css sense"
  prop size, :string, values: ["small", "normal", "medium", "large"]

  @doc "Color of select"
  prop color_type, :string,
    values: ["primary", "link", "info", "success", "warning", "danger"],
    default: nil

  @doc "Will expand dropdown to full with"
  prop expanded, :boolean

  @doc "Will show rounded dropdown"
  prop rounded, :boolean

  def render(assigns) do
    ~H"""
      <Field class={{"field", "is-expanded": @expanded}} name={{@field}}>
      <div class="control">
        <Label :if={{@label}} class="label">{{@label}}</Label>
          <div class={{"select", "is-#{@size}": @size, "is-#{@color_type}": @color_type }}>
          <Select
            field={{@field}}
            opts={{ [disabled: @disabled] ++ @opts  }}
            class={{
              [
                "is-fullwidth": @expanded,
                rounded: @rounded
              ] ++ @class}}
            options={{@options}}
            selected={{@selected}}
            prompt={{@prompt}}
            />
          </div>
      </div>
      </Field>
    """
  end
end
