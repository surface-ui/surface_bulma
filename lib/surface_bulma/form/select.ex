defmodule SurfaceBulma.Form.Select do
  @moduledoc """
  The select component as defined here:
  - https://bulma.io/documentation/form/select/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#select/4
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#multiple_select/4
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Label, MultipleSelect, Select}

  for prop <- Select.__props__() do
    Module.put_attribute(__MODULE__, :prop, prop)
    Module.put_attribute(__MODULE__, :assigns, prop)
  end

  @doc "The string label of the field"
  prop label, :string

  @doc "Disable selection"
  prop disabled, :boolean, default: false

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
    select_props =
      Enum.reduce(Select.__props__(), %{}, fn %{name: name}, acc ->
        Map.put(acc, name, assigns[name])
      end)
      |> Map.update(:class, [], fn nil -> 
          get_config(Select, :default_class)
        value ->
        value
      end)

    ~F"""
      <Field class={ "field", "is-expanded": @expanded } name={@field}>
        <div class="control">
          <Label :if={@label} class="label">{@label}</Label>
            <div class={
              "select",
              "is-#{@size}": @size,
              "is-#{@color_type}": @color_type,
              "is-multiple": @multiple,
              "is-fullwidth": @expanded}>
            {#if @multiple}
            <MultipleSelect
                {...select_props}
                field={@field}
                opts={[disabled: @disabled] ++ @opts }
                class={["is-fullwidth": @expanded, rounded: @rounded] ++ (@class || [])}
                options={@options}
                selected={@selected}
                />
            {/if}
            {#if !@multiple}
              <Select
                  {...select_props}
                field={@field}
                opts={[disabled: @disabled] ++ @opts }
                class={
                  [
                    "is-fullwidth": @expanded,
                    rounded: @rounded
                  ] ++ (@class || [])}
                options={@options}
                selected={@selected}
                prompt={@prompt}
                />
            {/if}
            </div>
        </div>
      </Field>
    """
  end
end
