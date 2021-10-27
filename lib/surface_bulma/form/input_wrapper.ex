defmodule SurfaceBulma.Form.InputWrapper do
  @moduledoc """
  This component provides a wrapper for form inputs.

  This can be used to wrap new inputs that want to have addons and icons.
  """
  use SurfaceBulma.Form.FieldBase
  use SurfaceBulma.Form.InputAddonBase
  use SurfaceBulma.Form.InputIconBase

  alias Surface.Components.Form.{ErrorTag, Field, Label}
  alias SurfaceBulma.Icon.FontAwesome, as: FA

  import SurfaceBulma.Form.Utils
  import Phoenix.LiveView.Helpers

  @doc "Whether the input has addons"
  prop has_addons, :boolean, default: false

  prop field, :any

  @doc "Attrs to add to the control div"
  prop control_attrs, :map, default: %{}

  @doc "Disable default fontawesome icons tied to validation"
  prop(disable_icons, :boolean, default: false)

  slot default, args: [:form]

  def render(assigns) do
    ~F"""
    <Context get={is_addon: is_addon}>
      {#if is_addon}
        {render_input(assigns)}
      {#else}
      <Field class={
        ["field",
        "has-addons": @has_addons,
        "is-expanded": @expanded,
        "is-horizontal": @is_horizontal
        ]++ @field_class}
        name={@field}>
        <Label :if={!@has_addons && @label} class="label">{@label}</Label>
        <#slot name="left_addon" />
        {render_input(assigns)}
        <#slot name="right_addon" />
        <span :if={@help_text && !has_error?(assigns)} class="help">{@help_text}</span>
      </Field>
      {/if}
    </Context>
    """
  end

  def render_input(assigns) do
    ~F"""
    <Context get={Surface.Components.Form, form: form}>
      <div class={
        "control",
        "has-icons-right": display_right_icon?(assigns),
        "has-icons-left": display_left_icon?(assigns),
        "is-expanded": @expanded
        } {...@control_attrs}>
        <#slot :args={form: form} />
        {#if is_binary(Map.get(assigns, :icon_left))}
          <FA icon={Map.get(assigns, :icon_left)} container_class={["is-#{@size}", "is-left"]}/>
        {/if}
        {#if is_binary(Map.get(assigns, :icon_right))}
          <FA icon={Map.get(assigns, :icon_right)} size={@size} container_class={["is-right"]}/>
        {/if}
        {render_common_text_input_fields(assigns)}
      </div>
    </Context>
    """
  end

  def render_left_addon(assigns) do
    ~F"""
    <Context :if={slot_assigned?(:left_addon)} put={is_addon: true}>
      {#for {_, index} <- Enum.with_index(@left_addon)}
        <Context put={is_addon: true}>
          <#slot name="left_addon" index={index}/>
        </Context>
      {/for}
    </Context>
    """
  end

  def render_right_addon(assigns) do
    ~F"""
    <Context :if={slot_assigned?(:right_addon)} put={is_addon: true}>
      {#for {_, index} <- Enum.with_index(@right_addon)}
        <#slot name="right_addon" index={index}/>
      {/for}
    </Context>
    """
  end

  def has_addons?(assigns) do
    slot_assigned?(:left_addon) || slot_assigned?(:right_addon)
  end

  def render_common_text_input_fields(assigns) do
    if form = get_form(assigns) do
      field =
        if is_binary(assigns.field) do
          String.to_atom(assigns.field)
        else
          assigns.field
        end

      ~F"""
      <ErrorTag class="help is-danger" field={field} form={form}/>
      <FA :if={display_error_icon?(assigns)} color="danger" icon="exclamation-triangle" container_class={["is-small", "is-right"]}/>
      <FA :if={display_valid_icon?(assigns)} color="success" icon="check" container_class={["is-small", "is-right"]}/>
      """
    else
      nil
    end
  end
end
