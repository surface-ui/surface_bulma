defmodule SurfaceBulma.Form.Submit do
  use SurfaceBulma.Component
  use SurfaceBulma.Form.InputAddonBase
  alias SurfaceBulma.Button

  include(Button)
  slot default

  prop expanded, :boolean

  @impl true
  def render(assigns) do
    props = included_props(assigns)

    ~F"""
    <div class={
        "field",
        "has-addons": (slot_assigned?(:left_addon) || slot_assigned?(:right_addon)),
        "is-expanded": @expanded,
        }>
      <div class="control">
        <div :if={slot_assigned?(:left_addon)} class="control">
          <#slot name="left_addon"/>
        </div>
        <Button {...props} type="submit"><#slot /></Button>
      </div>
    </div>
    """
  end
end
