defmodule SurfaceBulma.Button do
  @moduledoc """
  The classic **button**, in different colors, sizes, and states
  """
  alias SurfaceBulma.{ClassProp, ColorProp, SizeProp}
  use Surface.Component

  @doc """
  The button type, defaults to "button", mainly used for instances like modal X to close style buttons
  where you don't want to set a type at all. Setting to nil makes button have no type.
  """
  prop type, :string, default: "button"

  @doc "The label of the button, when no content (default slot) is provided"
  prop label, :string

  @doc "The aria label for the button"
  prop aria_label, :string

  use ColorProp

  use SizeProp

  @doc "Is link?"
  prop link, :boolean

  @doc "The value for the button"
  prop value, :string

  @doc "Button is expanded (full-width)"
  prop expand, :boolean

  @doc "Set the button as disabled preventing the user from interacting with the control"
  prop disabled, :boolean

  @doc "Outlined style"
  prop outlined, :boolean

  @doc "Inverted style"
  prop inverted, :boolean

  @doc "Rounded style"
  prop rounded, :boolean

  @doc "Light style"
  prop light, :boolean

  @doc "Hovered style"
  prop hovered, :boolean

  @doc "Focused style"
  prop focused, :boolean

  @doc "Active style"
  prop active, :boolean

  @doc "Selected style"
  prop selected, :boolean

  @doc "Static style"
  prop static, :boolean

  @doc "Loading state"
  prop loading, :boolean

  @doc "Triggered on click"
  prop click, :event

  use ClassProp, default: "button"

  @doc """
  Additional attributes to add onto the generated element
  """
  prop opts, :keyword, default: []

  @doc """
  Whether or not this button is used as an addon to a form field.
  """
  prop addon, :boolean, default: false

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  use SurfaceBulma.ContextClass

  data is_addon, :boolean, from_context: {SurfaceBulma.Form, :is_addon}

  def render(assigns) do
    ~F"""
    {#if @is_addon || @addon}
      <div class="control">
        {render_button(assigns)}
      </div>
    {#else}
      {render_button(assigns)}
    {/if}
    """
  end

  def render_button(assigns) do
    ~F"""
    <button
      type={@type}
      aria-label={@aria_label}
      :on-click={@click}
      disabled={@disabled}
      value={@value}
      class={classes(assigns,
        button: @class == [],
        "is-#{@color}": @color,
        "is-#{@size}": @size,
        "is-fullwidth": @expand,
        "is-outlined": @outlined,
        "is-inverted": @inverted,
        "is-rounded": @rounded,
        "is-light": @light,
        "is-hovered": @hovered,
        "is-focused": @focused,
        "is-active": @active,
        "is-loading": @loading,
        "is-selected": @selected,
        "is-link": @link,
        "is-static": @static
      )}
      {...@opts}
    >
      <#slot>{@label}</#slot>
    </button>
    """
  end
end
