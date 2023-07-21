defmodule SurfaceBulma.Form.FieldBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBulma.Component
      import SurfaceBulma.Form.Utils

      @doc "The string label of the field"
      prop label, :string

      use SurfaceBulma.SizeProp, "input"

      @doc "Should input fill entire width of form?"
      prop expanded, :boolean

      @doc "Whether or not the field is horizontal"
      prop is_horizontal, :boolean, default: false

      @doc "Help text, will be replaced by error text if changeset gets errors"
      prop help_text, :string

      @doc "Class to apply to the Field"
      prop field_class, :css_class, default: []
    end
  end
end
