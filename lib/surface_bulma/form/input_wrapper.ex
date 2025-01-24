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

  @doc "Whether the input has addons"
  prop has_addons, :boolean, default: false

  prop field, :any

  @doc "Attrs to add to the control div"
  prop control_attrs, :map, default: %{}

  @doc "Disable default fontawesome icons tied to validation"
  prop disable_icons, :boolean, default: false

  @doc "Disable icons if input is an addon"
  prop disable_icons_if_addon, :boolean, default: false

  data is_addon, :boolean, from_context: {SurfaceBulma.Form, :is_addon}
  data form, :form, from_context: {SurfaceBulma.Form, :form}

  slot default, arg: %{form: :form}

  def render(assigns) do
    ~F"""
    {#if @is_addon}
      {render_input(assigns)}
    {#else}
      <Field
        class={["field", "has-addons": @has_addons, "is-expanded": @expanded, "is-horizontal": @is_horizontal] ++
          @field_class}
        name={@field}
      >
        <Label :if={!@has_addons && @label} class="label">{@label}</Label>
        {render_left_addon(assigns)}
        {render_input(assigns)}
        {render_right_addon(assigns)}
        <span :if={@help_text && !has_error?(assigns)} class="help">{@help_text}</span>
      </Field>
    {/if}
    """
  end

  def render_input(assigns) do
    ~F"""
    <div class={[
      "control",
      "has-icons-right": display_right_icon?(assigns),
      "has-icons-left": display_left_icon?(assigns),
      "is-expanded": @expanded
    ] ++ ([@control_attrs[:class]] || [])}>
      <#slot {@default, %{form: @form}} />
      {#if is_binary(Map.get(assigns, :icon_left))}
        <FA icon={Map.get(assigns, :icon_left)} container_class={["is-#{@size}", "is-left"]} />
      {/if}
      {#if is_binary(Map.get(assigns, :icon_right))}
        <FA icon={Map.get(assigns, :icon_right)} size={@size} container_class={["is-right"]} />
      {/if}
      {render_common_text_input_fields(assigns)}
    </div>
    """
  end

  def render_left_addon(assigns) do
    ~F"""
    {#if slot_assigned?(:left_addon)}
      {#for item <- @left_addon}
        <#slot {item} context_put={SurfaceBulma.Form, is_addon: true} />
      {/for}
    {/if}
    """
  end

  def render_right_addon(assigns) do
    ~F"""
    {#if slot_assigned?(:right_addon)}
      {#for item <- @right_addon}
        <#slot {item} context_put={SurfaceBulma.Form, is_addon: true} />
      {/for}
    {/if}
    """
  end

  def has_addons?(assigns) do
    slot_assigned?(:left_addon) || slot_assigned?(:right_addon)
  end

  def render_common_text_input_fields(assigns) do
    assigns =
      assign(assigns, :form, get_form(assigns))
      |> assign(
        :field,
        if is_binary(assigns.field) do
          String.to_atom(assigns.field)
        else
          assigns.field
        end
      )

    ~F"""
    {#if @form}
      <ErrorTag class="help is-danger" field={@field} form={@form} />
      <FA
        :if={display_error_icon?(assigns)}
        color="danger"
        icon="exclamation-triangle"
        container_class={["is-small", "is-right"]}
      />
      <FA
        :if={display_valid_icon?(assigns)}
        color="success"
        icon="check"
        container_class={["is-small", "is-right"]}
      />
    {/if}
    """
  end
end
