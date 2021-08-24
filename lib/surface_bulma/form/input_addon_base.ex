defmodule SurfaceBulma.Form.InputAddonBase do
  defmacro __using__(_) do
    quote do
      @doc """
      Slot adds content to left side of input.
      Only inputs, buttons and dropdowns are supported.
      NOTE: If you supply addons, the label is disabled.
      You cannot combine labels and addons. If you require
      field labels with addons you must use horizontal forms.
      See `SurfaceBulma.Form.HorizontalControlGroup`.
      """
      slot left_addon

      @doc """
      Slot adds content to right side of input.
      Only inputs, buttons and dropdowns are supported.
      NOTE: If you supply addons, the label is disabled.
      You cannot combine labels and addons. If you require
      field labels with addons you must use horizontal forms.
      See `SurfaceBulma.Form.HorizontalControlGroup`.
      """
      slot right_addon
    end
  end
end
