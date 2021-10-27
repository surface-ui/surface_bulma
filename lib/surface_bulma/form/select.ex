defmodule SurfaceBulma.Form.Select do
  @moduledoc """
  The select component as defined here:
  - https://bulma.io/documentation/form/select/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#select/4
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#multiple_select/4
  """

  use SurfaceBulma.Form.FieldBase
  use SurfaceBulma.Form.InputIconBase, :left
  use SurfaceBulma.Form.InputAddonBase

  alias SurfaceBulma.Form.InputWrapper

  import SurfaceBulma.Form.InputWrapper,
    only: [has_addons?: 1, render_left_addon: 1, render_right_addon: 1]

  alias Surface.Components.Form.{MultipleSelect, Select}

  include(Select)

  use SurfaceBulma.ColorProp

  @doc "Disable the select"
  prop(disabled, :boolean)

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
      <InputWrapper :let={form: form}
        field={@field}
        expanded={@expanded}
        icon_left={@icon_left}
        has_addons={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <div class={
          "select",
          "is-#{@size}": @size,
          "is-#{@color}": @color,
          "is-multiple": @multiple,
          "is-fullwidth": @expanded}>
        {#if @multiple}
          <MultipleSelect
            {...props}
            form={form || @form}
            opts={[disabled: @disabled] ++ @opts }
            class={["is-fullwidth": @expanded, rounded: @rounded] ++ (@class || [])}
            />
        {#else}
          <Select
            {...props}
            form={form || @form}
            opts={[disabled: @disabled] ++ @opts }
            class={
              [
                "is-fullwidth": @expanded,
                rounded: @rounded
              ] ++ (@class || [])}
            />
        {/if}
        </div>
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
    """
  end
end
