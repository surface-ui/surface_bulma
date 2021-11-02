defmodule SurfaceBulma.Level do
  @moduledoc """
  A multi-purpose horizontal level that can contain most elements.
  """
  use Surface.Component

  @doc "Whether or not the items are centered"
  prop centered, :boolean

  slot default
  slot left
  slot right

  def render(assigns) do
    ~F"""
    <div class="level">
      {#if slot_assigned?(:left)}
      <div class="level-left">
        {#for {_, index} <- Enum.with_index(@left)}
          <div class="level-item">
            <#slot name="left" index={index} />
          </div>
        {/for}
      </div>
      {/if}
      {#if slot_assigned?(:default)}
        {#for {_, index} <- Enum.with_index(@default)}
          <div class={"level-item", "has-text-centered": @centered}>
            <#slot name="default" index={index} />
          </div>
        {/for}
      {/if}
      {#if slot_assigned?(:right)}
      <div class="level-right">
        {#for {_, index} <- Enum.with_index(@right)}
          <div class="level-item">
            <#slot name="right" index={index} />
          </div>
        {/for}
      </div>
      {/if}
    </div>
    """
  end
end
