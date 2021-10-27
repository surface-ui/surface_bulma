defmodule SurfaceBulma.Form.InputBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBulma.Form.FieldBase

      alias SurfaceBulma.Form.InputWrapper

      @doc "Static input"
      prop(static, :boolean)

      @doc "Disable input"
      prop(disabled, :boolean)

      @doc "Read only"
      prop(readonly, :boolean)

      @doc "Disable default fontawesome icons tied to validation"
      prop(disable_icons, :boolean, default: false)
    end
  end
end
