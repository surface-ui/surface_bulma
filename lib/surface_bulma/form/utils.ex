defmodule SurfaceBulma.Form.Utils do
  def input_classes(assigns, other_classes \\ [])

  def input_classes(assigns, other_classes) when is_binary(other_classes) do
    input_classes(assigns, [other_classes])
  end

  def input_classes(assigns, other_classes) do
    ["input"] ++
      other_classes ++
      [
        "is-danger": has_change?(assigns) && has_error?(assigns),
        "is-success": has_change?(assigns) && !has_error?(assigns),
        "is-#{assigns[:size]}": assigns[:size] != "normal",
        "is-static": assigns[:static]
      ] ++ (assigns[:class] || [])
  end

  def display_right_icon?(%{disable_right_icon: true}), do: false

  def display_right_icon?(assigns) do
    (!Map.get(assigns, :disable_icons) &&
       (has_error?(assigns) || has_change?(assigns))) ||
      Map.get(assigns, :icon_right)
  end

  def display_left_icon?(assigns) do
    Map.get(assigns, :icon_left)
  end

  def display_error_icon?(assigns) do
    !Map.get(assigns, :disable_icons) && !Map.get(assigns, :icon_right) && has_error?(assigns) &&
      display_right_icon?(assigns)
  end

  def display_valid_icon?(assigns) do
    !Map.get(assigns, :disable_icons) &&
      !Map.get(assigns, :icon_right) &&
      has_change?(assigns) &&
      !has_error?(assigns) && display_right_icon?(assigns)
  end

  def has_error?(assigns) do
    get_form(assigns)
    |> field_has_error?(assigns.field)
  end

  def has_change?(assigns) do
    get_form(assigns)
    |> field_has_change?(assigns.field)
  end

  @doc "Helper function used by the form controls"
  def field_has_error?(%{source: %{errors: errors}}, field) do
    Enum.any?(errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  def field_has_error?(_not_form, _field), do: false

  @doc "Helper function used by the form controls"
  def field_has_change?(%{source: source}, field) when is_map(source) do
    Ecto.Changeset.get_change(source, field, false)
  end

  def field_has_change?(_not_form, _field), do: false

  @doc "Gets the form from the context. Works with a `Surface.Components.Form` and `SurfaceBulma.Form`."
  def get_form(%{__context__: context}) do
    case context do
      %{{Surface.Components.Form, :form} => form} -> form
      %{{SurfaceBulma.Form, :form} => form} -> form
      _ -> nil
    end
  end

  def text_size(size) do
    size =
      case size do
        "small" -> 7
        "normal" -> 5
        "medium" -> 4
        "large" -> 3
      end

    "is-size-#{size}"
  end
end
