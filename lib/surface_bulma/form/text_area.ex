defmodule SurfaceBulma.Form.TextArea do
  @moduledoc """
  The text area component as defined here: https://bulma.io/documentation/form/textarea/
  """

  use SurfaceBulma.Form.InputBase
  import SurfaceBulma.Form.Utils
  import SurfaceBulma.Form.InputWrapper, only: [render_common_text_input_fields: 1]

  alias Surface.Components.Form.TextArea

  include(TextArea)

  @doc "Placeholder value"
  prop placeholder, :string, default: nil

  def render(assigns) do
    input_classes = input_classes(assigns)

    ~F"""
      <InputWrapper :let={form: form}
        field={@field}
        label={@label}
        expanded={@expanded}
        help_text={@help_text}
        disable_icons={@disable_icons}
        field_class={@field_class}
        >
          <TextArea
          {...included_props(assigns)}
          class={["textarea"] ++ input_classes}
          form={@form || form}
          field={@field}
          opts={
            [placeholder: @placeholder,
            rows: @rows] 
            ++ @opts
            } />
          {render_common_text_input_fields(assigns)}
      </InputWrapper>
    """
  end
end
