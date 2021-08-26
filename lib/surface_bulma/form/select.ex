defmodule SurfaceBulma.Form.Select do
  @moduledoc """
  The select component as defined here:
  - https://bulma.io/documentation/form/select/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#select/4
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#multiple_select/4
  """

  use SurfaceBulma.Component
  use SurfaceBulma.Form.InputAddonBase
  alias Surface.Components.Form.{Field, Label, MultipleSelect, Select}

  include(Select)

  @doc "The string label of the field"
  prop label, :string

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Size of select in css sense"
  prop size, :string, values: ["small", "normal", "medium", "large"]

  use SurfaceBulma.ColorProp

  @doc "Will expand dropdown to full with"
  prop expanded, :boolean

  @doc "Will show rounded dropdown, ignored for multiple select"
  prop rounded, :boolean

  @doc "Multiple Select"
  prop multiple, :boolean

  def render(assigns) do
    props =
      included_props(assigns)
      |> Map.update(:class, [], fn
        nil ->
          get_config(Select, :default_class)

        value ->
          value
      end)

    ~F"""
      <Field class={
        "field", 
        "is-expanded": @expanded, 
        "has-addons": (slot_assigned?(:left_addon) || slot_assigned?(:right_addon))
        }
        name={@field}>
        <Label :if={@label} class="label">{@label}</Label>
        <div :if={slot_assigned?(:left_addon)} class="control">
          <#slot name="left_addon"/>
        </div>
        <div class="control">
            <div class={
              "select",
              "is-#{@size}": @size,
              "is-#{@color_type}": @color_type,
              "is-multiple": @multiple,
              "is-fullwidth": @expanded}>
            {#if @multiple}
              <MultipleSelect
                {...props}
                opts={[disabled: @disabled] ++ @opts }
                class={["is-fullwidth": @expanded, rounded: @rounded] ++ (@class || [])}
                />
            {#else}
              <Select
                {...props}
                opts={[disabled: @disabled] ++ @opts }
                class={
                  [
                    "is-fullwidth": @expanded,
                    rounded: @rounded
                  ] ++ (@class || [])}
                />
            {/if}
            </div>
        </div>
        <div :if={slot_assigned?(:right_addon)} class="control" >
          <#slot name="right_addon"/>
        </div>
      </Field>
    """
  end
end
