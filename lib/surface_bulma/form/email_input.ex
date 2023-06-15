defmodule SurfaceBulma.Form.EmailInput do
  @moduledoc """
  The email field component as defined here: https://bulma.io/documentation/form/input/
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.EmailInput

  include(EmailInput)
  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop(maxlength, :integer)

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop(minlength, :integer)

  def render(assigns) do
    input_classes = input_classes(assigns)

    ~F"""
    <InputWrapper
      :let={form: form}
      field={@field}
      label={@label}
      expanded={@expanded}
      help_text={@help_text}
      disable_icons={@disable_icons}
      icon_left={@icon_left}
      icon_right={@icon_right}
      field_class={@field_class}
      has_addons={has_addons?(assigns)}
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <EmailInput
        {...included_props(assigns, EmailInput)}
        class={input_classes}
        field={@field}
        form={@form || form}
        value={@value}
        opts={[
          placeholder: @placeholder,
          disabled: @disabled,
          readonly: @readonly,
          maxlength: @maxlength,
          minlength: @minlength
        ] ++ @opts}
      />
      <:right_addon>{render_right_addon(assigns)}</:right_addon>
    </InputWrapper>
    """
  end
end
