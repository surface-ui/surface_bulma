defmodule SurfaceBulma.Form.InputBase do
  defmacro __using__(_) do
    quote do
      import SurfaceBulma.Form.InputBase
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

      @doc "Value to pass on to field if you want to pre-populate"
      prop value, :string, default: nil

      @doc "Should input fill entire width of form?"
      prop expanded, :boolean

      @doc "Disable input"
      prop disabled, :boolean

      @doc "Static input"
      prop static, :boolean

      @doc "Read only"
      prop readonly, :boolean

      @doc "Help text, will be replaced by error text if changeset gets errors"
      prop help_text, :string

      @doc "Triggered when the component loses focus"
      prop blur, :event

      @doc "Triggered when the component receives focus"
      prop focus, :event

      @doc "Triggered when the component receives click"
      prop capture_click, :event

      @doc "Triggered when a button on the keyboard is pressed"
      prop keydown, :event

      @doc "Triggered when a button on the keyboard is released"
      prop keyup, :event
    end
  end

  import SurfaceBulma.Form, only: [field_has_error?: 2, field_has_change?: 2]
  import Surface
  alias Surface.Components.Form.ErrorTag
  alias SurfaceBulma.Icon.FontAwesome, as: FA
  alias Surface.Constructs.If
  import Phoenix.LiveView.Helpers

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
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_error?(form, assigns.field)
  end

  def has_change?(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_change?(form, assigns.field)
  end

  def render_common_text_input_fields(assigns) do
    ~H"""
    <ErrorTag class="help is-danger" field={{assigns.field}}/>
    <If condition={{is_binary(Map.get(assigns, :icon_left))}}>
      <FA icon={{Map.get(assigns, :icon_left)}} container_class={{["is-small", "is-left"]}}/>
    </If>
    <If condition={{is_binary(Map.get(assigns, :icon_right))}}>
      <FA icon={{Map.get(assigns, :icon_right)}} container_class={{["is-small", "is-right"]}}/>
    </If>
    <FA :if={{ display_error_icon?(assigns) }} primary_color="red" icon="exclamation-triangle" container_class={{["is-small", "is-right"]}}/>
    <FA :if={{ display_valid_icon?(assigns)}} primary_color="green" icon="check" container_class={{["is-small", "is-right"]}}/>
    """
  end
end
