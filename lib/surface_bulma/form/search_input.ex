defmodule SurfaceBulma.Form.SearchInput do
  @moduledoc """
  A search input component with a Submit as a RightAddon.

  To override the submit button, put a different component in the RightAddon slot.
  """

  use SurfaceBulma.Form.TextInputBase
  alias SurfaceBulma.Form.Submit

  alias Surface.Components.Form.SearchInput

  include(SearchInput)

  @doc "Whether or not to hide the \"search\" button to the component"
  prop hide_button, :boolean, default: false

  @doc "Optional properties for the search button"
  prop button_props, :map, default: %{}

  def render(assigns) do
    assigns = assign(assigns, :input_classes, input_classes(assigns))

    ~F"""
    <InputWrapper
      :let={form: form}
      field={@field}
      expanded={@expanded}
      help_text={@help_text}
      disable_icons={@disable_icons}
      icon_left={@icon_left}
      icon_right={@icon_right}
      field_class={@field_class}
      control_attrs={class: "is-flex-grow-1"}
      has_addons
    >
      <:left_addon>{render_left_addon(assigns)}</:left_addon>
      <SearchInput
        {...included_props(assigns, SearchInput)}
        class={@input_classes}
        field={@field}
        form={@form || form}
        value={@value}
        opts={[
          placeholder: @placeholder,
          disabled: @disabled
        ] ++ @opts}
      />
      <:right_addon>
        {#if !slot_assigned?(:right_addon) || !@hide_button}
          <Context put={SurfaceBulma.Form, is_addon: true}>
            <Submit color="primary" {...@button_props}>{@label || "Search"}</Submit>
          </Context>
        {/if}
        {render_right_addon(assigns)}
      </:right_addon>
    </InputWrapper>
    """
  end
end
