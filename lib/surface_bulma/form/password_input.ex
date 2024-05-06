defmodule SurfaceBulma.Form.PasswordInput do
  @moduledoc """
  The password field component as defined here:
  - https://bulma.io/documentation/form/input/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#password_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/password
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.PasswordInput
  include(PasswordInput)

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop maxlength, :integer

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop minlength, :integer

  def render(assigns) do
    assigns =
      assign(assigns, :input_classes, input_classes(assigns))
      |> assign(:props, included_props(assigns, PasswordInput))

    ~F"""
    <InputWrapper
      :let={form: form}
      label={@label}
      field={@field}
      expanded={@expanded}
      help_text={@help_text}
      disable_icons={@disable_icons}
      icon_left={@icon_left}
      icon_right={@icon_right}
      has_addons={has_addons?(assigns)}
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <PasswordInput
        {...@props}
        class={@input_classes}
        value={@value}
        form={@form || form}
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
