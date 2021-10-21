defmodule SurfaceBulma.Form.InputWrapper do
  use SurfaceBulma.Form.InputBase

  alias Surface.Components.Form.{ErrorTag, Field, Label}
  alias SurfaceBulma.Icon.FontAwesome, as: FA
  import Phoenix.LiveView.Helpers
  import SurfaceBulma.Form, only: [field_has_error?: 2, field_has_change?: 2]

  @doc "Whether the input has addons"
  prop has_addons?, :boolean

  prop field, :any

  slot default, args: [:form]

  def render(assigns) do
    ~F"""
    <Context get={is_addon: is_addon, form: form}>
      <Field class={
        [field: !is_addon,
        control: is_addon,
        "has-addons": @has_addons?,
        "is-expanded": @expanded,
        "is-horizontal": @is_horizontal
        ]++ @field_class
        }
        name={@field}>
        <Label :if={!@has_addons? && @label} class="label">{@label}</Label>
          <#slot name="left_addon" />
        <div class={
          "control",
          "has-icons-right": display_right_icon?(assigns),
          "has-icons-left": display_left_icon?(assigns),
          "is-expanded": @expanded
          }>
          <#slot :args={form: form} />
          {render_common_text_input_fields(assigns)}
        </div>
        <#slot name="right_addon" />
        <span :if={@help_text && !has_error?(assigns)} class="help">{@help_text}</span>
      </Field>
    </Context>
    """
  end

  def display_right_icon?(assigns) do
    (!Map.get(assigns, :disable_icons) &&
       (has_error?(assigns) || has_change?(assigns))) ||
      Map.get(assigns, :icon_right)
  end

  def display_left_icon?(assigns) do
    Map.get(assigns, :icon_left)
  end

  def display_error_icon?(assigns) do
    !Map.get(assigns, :disable_icons) && !Map.get(assigns, :icon_right) && has_error?(assigns)
  end

  def display_valid_icon?(assigns) do
    !Map.get(assigns, :disable_icons) &&
      !Map.get(assigns, :icon_right) &&
      has_change?(assigns) &&
      !has_error?(assigns)
  end

  def has_error?(assigns) do
    get_form(assigns)
    |> field_has_error?(assigns.field)
  end

  def has_change?(assigns) do
    get_form(assigns)
    |> field_has_change?(assigns.field)
  end

  def render_common_text_input_fields(
        %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns
      )
      when is_map(form) do
    field =
      if is_binary(assigns.field) do
        String.to_atom(assigns.field)
      else
        assigns.field
      end

    ~F"""
    <ErrorTag class="help is-danger" field={field} form={form}/>
    {#if is_binary(Map.get(assigns, :icon_left))}
      <FA icon={Map.get(assigns, :icon_left)} container_class={["is-small", "is-left"]}/>
    {/if}
    {#if is_binary(Map.get(assigns, :icon_right))}
      <FA icon={Map.get(assigns, :icon_right)} container_class={["is-small", "is-right"]}/>
    {/if}
    <FA :if={display_error_icon?(assigns)} color="danger" icon="exclamation-triangle" container_class={["is-small", "is-right"]}/>
    <FA :if={display_valid_icon?(assigns)} color="success" icon="check" container_class={["is-small", "is-right"]}/>
    """
  end

  def render_common_text_input_fields(_), do: nil

  def has_addons?(assigns) do
    slot_assigned?(:left_addon) || slot_assigned?(:right_addon)
  end

  def render_left_addon(assigns) do
    ~F"""
      <div :if={slot_assigned?(:left_addon)} class="control">
        <Context put={is_addon: true}>
          <#slot name="left_addon" />
        </Context>
      </div>
    """
  end

  def render_right_addon(assigns) do
    ~F"""
      <div :if={slot_assigned?(:right_addon)} class="control">
        <Context put={is_addon: true}>
          <#slot name="right_addon" />
        </Context>
      </div>
    """
  end

  defp get_form(%{__context__: %{{Surface.Components.Form, :form} => form}}) when is_map(form) do
    form
  end

  defp get_form(_) do
    %{errors: [],
      changes: []}
  end
end
