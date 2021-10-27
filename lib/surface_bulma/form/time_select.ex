defmodule SurfaceBulma.Form.TimeSelect do
  @moduledoc """
  A time selector with configurable separators between the parts of the time.
  """
  use SurfaceBulma.Form.FieldBase
  use SurfaceBulma.Form.InputIconBase, :left
  use SurfaceBulma.Form.InputAddonBase

  alias Surface.Components.Form.TimeSelect
  alias SurfaceBulma.Form.InputWrapper

  import SurfaceBulma.Form.InputWrapper,
    only: [has_addons?: 1, render_left_addon: 1, render_right_addon: 1]

  include(TimeSelect)

  use SurfaceBulma.ColorProp

  @doc "Will show rounded dropdown, ignored for multiple select"
  prop rounded, :boolean

  def render(assigns) do
    props = included_props(assigns)
    span_style = if assigns[:size] != "small", do: "vertical-align: text-top;", else: ""

    builder = fn b ->
      ~F"""
        <div class={
              "select",
              "is-#{@size}": @size,
              "is-#{@color}": @color,
              "is-fullwidth": @expanded}>
          {html_escape(b.(:hour, [style: "border: none;"]))}
        </div>
        <span class={"control", "has-text-weight-medium", text_size(@size)} style={span_style}>:</span>
        <div class={
              "select",
              "is-#{@size}": @size,
              "is-#{@color}": @color,
              "is-fullwidth": @expanded}>
          {html_escape(b.(:minute, [style: "border: none;"]))}
        </div>
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
        <TimeSelect
          {...props}
          form={@form || form}
          hour={@hour || []}
          minute={@minute || [class: "pl-3"]}
          opts={@opts}
          builder={builder}
          />
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
    """
  end
end
