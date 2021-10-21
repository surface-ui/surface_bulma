defmodule SurfaceBulma.Form.InputBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBulma.Component

      alias SurfaceBulma.Form.InputWrapper

      @doc "Static input"
      prop(static, :boolean)

      @doc "Disable input"
      prop(disabled, :boolean)

      @doc "Read only"
      prop(readonly, :boolean)

      @doc "The string label of the field"
      prop(label, :string)

      @doc "Placeholder value"
      prop placeholder, :string, default: nil

      @doc "Should input fill entire width of form?"
      prop(expanded, :boolean)

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

      @doc "Whether or not the field is horizontal"
      prop is_horizontal, :boolean, default: false

      @doc "Disable default fontawesome icons tied to validation"
      prop(disable_icons, :boolean, default: false)

      @doc "Class to apply to Field"
      prop(field_class, :css_class, default: [])

      @doc "Help text, will be replaced by error text if changeset gets errors"
      prop(help_text, :string)

      slot left_addon, args: [:form]
      slot right_addon, args: [:form]
    end
  end
end
