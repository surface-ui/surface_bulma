defmodule SurfaceBulma.Form.DateTimeSelect do
  use SurfaceBulma.Form.FieldBase
  use SurfaceBulma.Form.InputIconBase, :left
  use SurfaceBulma.Form.InputAddonBase

  alias Surface.Components.Form.DateTimeSelect
  alias SurfaceBulma.Form.InputWrapper

  import SurfaceBulma.Form.InputWrapper,
    only: [has_addons?: 1, render_left_addon: 1, render_right_addon: 1]

  include(DateTimeSelect)

  use SurfaceBulma.ColorProp

  @doc "Will show rounded dropdown, ignored for multiple select"
  prop rounded, :boolean

  @doc "Separators between the different selects"
  prop separators, :keyword, default: [year: "/", month: "/", day: "/", hour: ":"]

  def render(assigns) do
    props = included_props(assigns)
    span_style = if assigns[:size] != "small", do: "vertical-align: text-top;", else: ""

    builder = fn b ->
      ~F"""
      {#for {item, index} <- Enum.with_index(~w/year month day hour minute/a)}
        <div class={
              "select",
              "is-#{@size}": @size,
              "is-#{@color}": @color,
              "is-fullwidth": @expanded}>
          {html_escape(b.(item, [style: "border: none;", class: index != 0 && "pl-3" || nil]))}
        </div>
        {#if @separators[item] }
          <span class={"control", "has-text-weight-medium", text_size(@size)} 
            style={span_style}>{@separators[item]}</span>
        {/if}
      {/for}
      """
    end

    ~F"""
      <InputWrapper :let={form: form}
        field={@field}
        size={@size}
        icon_left={@icon_left}
        expanded={@expanded}
        control_attrs={%{"style" => "display: inline-block; max-width: 100%; border: 1px solid #dbdbdb; border-radius: 4px;"}}
        has_addons={has_addons?(assigns)}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        <DateTimeSelect
          {...props}
          form={form || @form}
          opts={@opts}
          builder={builder}
          year={@year || []}
          month={@month || [class: "pl-3"]}
          day={@day || [class: "pl-3"]}
          hour={@hour || [class: "pl-3"]}
          minute={@minute || [class: "pl-3"]}
          />
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
    """
  end
end
