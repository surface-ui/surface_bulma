defmodule SurfaceBulma.Form.DateTimeLocalInput do
  @moduledoc """
  The datetime standardized input
  """

  use SurfaceBulma.Form.TextInputBase

  alias Surface.Components.Form.DateTimeLocalInput
  include(DateTimeLocalInput)

  @doc "Largest datetime allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Earliest datetime allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc """
  For datetime-local inputs, the value of step is given in seconds,
  with a scaling factor of 1000 (since the underlying numeric value is in milliseconds).
  The default value of step is 60, indicating 60 seconds (or 1 minute, or 60,000 milliseconds).
  """
  prop step, :integer, default: 60

  def render(assigns) do
    props = included_props(assigns, DateTimeLocalInput)
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
      has_addons={has_addons?(assigns)}
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <DateTimeLocalInput
        {...props}
        class={input_classes}
        field={@field}
        form={@form || form}
        value={@value}
        opts={[
          disabled: @disabled,
          readonly: @readonly,
          max: @max,
          min: @min,
          step: @step
        ] ++ @opts}
      />
      <:right_addon>{render_right_addon(assigns)}</:right_addon>
    </InputWrapper>
    """
  end
end
