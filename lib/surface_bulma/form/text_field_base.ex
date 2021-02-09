defmodule SurfaceBulma.Form.TextFieldBase do
  defmacro __using__(_) do
    quote do
      import SurfaceBulma.Form.TextFieldBase
      @doc "The the field on the changeset"
      prop field, :atom, required: true

      @doc "The string label of the field"
      prop label, :string

      @doc "Disable default fontawesome icons tied to validation"
      prop disable_icons, :boolean, default: false

      @doc "Class to apply to input"
      prop class, :css_class, default: []

      @doc "Any opts you want to pass on to internal `input` from `Phoenix.HTML.Form`"
      prop opts, :keyword, default: []

      @doc "Placeholder value"
      prop placeholder, :string, default: nil

      @doc """
      Icon to place on the left side of input box. Must be a valid icon.
      Bulma does not currently support stacked / layered icons inside a form control.
      """
      prop icon_left, :any, default: nil

      @doc """
      Icon to place on the right side of input box. Must be a valid icon.
      Setting this prop will overwrite (and not display) any of the generated
      icons for validations, similar to setting disable_icons="true".
      Bulma does not currently support stacked / layered icons inside a form control.
      """
      prop icon_right, :any, default: nil

      @doc "Should input fill entire width of form?"
      prop expanded, :boolean

      @doc "Disable input"
      prop disabled, :boolean

      @doc "Static input"
      prop static, :boolean

      @doc "Read only"
      prop readonly, :boolean

      @doc """
      Slot adds content to left side of input.
      Only inputs, buttons and dropdowns are supported.
      NOTE: If you supply addons, the label is disabled.
      You cannot combine labels and addons. If you require
      field labels with addons you must use horizontal forms.
      See `SurfaceBulma.Form.HorizontalForm`.
      """
      slot left_addon

      @doc """
      Slot adds content to right side of input.
      Only inputs, buttons and dropdowns are supported.
      NOTE: If you supply addons, the label is disabled.
      You cannot combine labels and addons. If you require
      field labels with addons you must use horizontal forms.
      See `SurfaceBulma.Form.HorizontalForm`.
      """
      slot right_addon
    end
  end

  import SurfaceBulma.Form, only: [field_has_error?: 2, field_has_change?: 2]
  import Surface
  alias Surface.Components.Form.ErrorTag
  alias SurfaceBulma.Icon.FontAwesome, as: FA
  alias Surface.Constructs.If
  import Phoenix.LiveView.Helpers

  def display_right_icon?(assigns) do
    (!assigns.disable_icons && (has_error?(assigns) || has_change?(assigns))) ||
      assigns.icon_right
  end

  def display_left_icon?(assigns) do
    assigns.icon_left
  end

  def display_error_icon?(assigns) do
    !assigns.disable_icons && !assigns.icon_right && has_error?(assigns)
  end

  def display_valid_icon?(assigns) do
    !assigns.disable_icons && !assigns.icon_right && has_change?(assigns) &&
      !has_error?(assigns)
  end

  def has_error?(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_error?(form, assigns.field)
  end

  def has_change?(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_change?(form, assigns.field)
  end

  def render_icons_and_errors(assigns) do
    ~H"""
    <ErrorTag class="help is-danger" field={{assigns.field}}/>
    <If condition={{is_binary(assigns.icon_left)}}>
      <FA icon={{assigns.icon_left}} container_class={{["is-small", "is-left"]}}/>
    </If>
    <If condition={{is_binary(assigns.icon_right)}}>
      <FA icon={{assigns.icon_right}} container_class={{["is-small", "is-right"]}}/>
    </If>
    <FA :if={{ display_error_icon?(assigns) }} icon="exclamation-triangle" container_class={{["is-small", "is-right"]}}/>
    <FA :if={{ display_valid_icon?(assigns)}} icon="check" container_class={{["is-small", "is-right"]}}/>
    """
  end
end
