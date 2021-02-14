defmodule SurfaceBulma.Form.InputIconBase do
  defmacro __using__(_) do
    quote do
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
    end
  end
end
