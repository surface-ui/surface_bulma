defmodule SurfaceBulma.Form.Select do
  @moduledoc """
  The select component as defined here:
  - https://bulma.io/documentation/form/select/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#select/4
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#multiple_select/4
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Label, MultipleSelect, Select}

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

  @doc """
  The selected value.
  For multiple selects this has to be a list that matches the value options.
  """
  prop selected, :any

  @doc "The prompt (nothing selected yet) string, is ignored for multiple selects."
  prop prompt, :string

  @doc "Size of select in css sense"
  prop size, :string, values: ["small", "normal", "medium", "large"]

  @doc "Color of select"
  prop color_type, :string,
    values: ["primary", "link", "info", "success", "warning", "danger"],
    default: nil

  @doc "Will expand dropdown to full with"
  prop expanded, :boolean

  @doc "Will show rounded dropdown, ignored for multiple select"
  prop rounded, :boolean

  @doc "Multiple Select"
  prop multiple, :boolean

  def render(assigns) do
    ~H"""
      <Field class={{
        "field",
        "is-expanded": @expanded

        }} name={{@field}}>
      <div class="control">
        <Label :if={{@label}} class="label">{{@label}}</Label>
          <div class={{
            "select",
            "is-#{@size}": @size,
            "is-#{@color_type}": @color_type,
            "is-multiple": @multiple,
            "is-fullwidth": @expanded }}>
          <If condition={{@multiple}}>
          <MultipleSelect
              field={{@field}}
              opts={{ [disabled: @disabled] ++ @opts  }}
              class={{
                [
                  "is-fullwidth": @expanded,
                  rounded: @rounded
                ] ++ @class}}
              options={{@options}}
              selected={{@selected}}
              />
          </If>
          <If condition={{!@multiple}}>
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
          </If>

          </div>
      </div>
      </Field>
    """
  end
end
