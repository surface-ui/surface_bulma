defmodule SurfaceBulma.Form.FileInput do
  @moduledoc """
  A file input that can be used in forms
  """
  use SurfaceBulma.Form.FieldBase
  use SurfaceBulma.Form.InputAddonBase
  import SurfaceBulma.Form.InputWrapper, only: [has_addons?: 1]
  alias SurfaceBulma.Form.InputWrapper
  alias Surface.Components.Form.FileInput

  include(FileInput)

  alias SurfaceBulma.Icon.FontAwesome, as: FA

  @doc """
  The icon to display in the file upload
  """
  prop icon, :string

  @doc """
  The text to display next to the optional icon
  """
  prop file_label, :string, default: "Choose a file..."

  @doc """
  The input can be displayed as a box by setting this to true
  """
  prop boxed, :boolean

  @doc """
  The name of the uploaded file
  """
  prop file_name, :string

  @doc """
  Position of the upload button
  """
  prop button_right, :boolean

  use SurfaceBulma.ColorProp

  @doc false
  data props, :map

  def render(assigns) do
    assigns = assign(assigns, :props, included_props(assigns, FileInput))

    ~F"""
    <InputWrapper
      :let={form: form}
      field={@field}
      label={@label}
      expanded={@expanded}
      help_text={@help_text}
      field_class={@field_class}
      has_addons={has_addons?(assigns)}
    >
      <:left_addon><#slot {@left_addon} /></:left_addon>
      <div class={
        "file",
        "is-#{@size}",
        "has-name": @file_name,
        "is-right": @button_right,
        "is-boxed": @boxed,
        "is-fullwidth": @expanded
      }>
        <label class="file-label">
          <FileInput
            {...@props}
            class="file-input"
            form={@form}
            field={@field}
            opts={onchange: "setFile('#{@form || form}_#{@field}')"}
          />
          <span class="file-cta">
            <span :if={@icon} class="file-icon">
              <FA icon={@icon} />
            </span>
            <span class="file-label">
              {@file_label}
            </span>
          </span>
          <span class="file-name">
          </span>
        </label>
      </div>
      <:right_addon><#slot {@right_addon} /></:right_addon>
      <script>
      if (setFile === undefined){
        function setFile(id) {
          const fileInput = document.getElementById(id);
          console.log(fileInput)
          if (fileInput.files.length > 0) {
            console.log(fileInput.parentNode);
            console.log(fileInput.parentNode.getElementsByClassName('file-name'));
            const fileName = fileInput.parentNode.getElementsByClassName('file-name')[0];
            fileName.textContent = fileInput.files[0].name;
          }
        }
      }
      </script>
    </InputWrapper>
    """
  end
end
