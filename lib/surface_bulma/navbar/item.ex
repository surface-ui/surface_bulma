defmodule SurfaceBulma.Navbar.Item do
  use Surface.Component, slot: "items"
  alias Surface.Components.{LivePatch, LiveRedirect}

  use SurfaceBulma.ColorProp

  @doc "The path to follow when it is clicked"
  prop path, :string

  @doc "Whether to use a LiveRedirect"
  prop redirect, :boolean

  @doc "Whether to use a LivePatch"
  prop patch, :boolean

  prop class, :css_class

  slot default, required: true
  slot items
  slot buttons

  def render(assigns) do
    ~F"""
    <Context get={__MODULE__, is_subitem: is_subitem}>
      {#if is_subitem}
        {render_link(assigns)}
      {#else}
        {#if slot_assigned?(:items) }
          <div class={classes(assigns)}>
            {render_link(Map.put(assigns, :class, "navbar-link"))}
            <div class="navbar-dropdown">
              {render_subitems(assigns)}
            </div>
          </div> 
        {#else}
          {render_link(assigns)}
        {/if}
      {/if}
    </Context>
    """
  end

  def render_subitems(assigns) do
    ~F"""
    {#if slot_assigned?(:items)}
    <Context put={__MODULE__, is_subitem: true}>
      {#for {_, index} <- Enum.with_index(@items)}
        <#slot name="items" index={index} />
      {/for}
    </Context>
    {/if}
    """
  end

  def render_link(assigns) do
    class = classes(assigns, assigns[:class])

    ~F"""
    {#if slot_assigned?(:buttons)}
      <div class="navbar-item">
        <#slot name="buttons" />
      </div>
    {#elseif @redirect}
      <LiveRedirect to={@path} class={class}>
        <#slot />
      </LiveRedirect>
    {#elseif @patch}
      <LivePatch to={@path} class={class}>
        <#slot />
      </LivePatch>
    {#else}
      <a href={@path} class={class}>
        <#slot />
      </a>
    {/if}
    """
  end

  defp classes(assigns, class) do
    base_classes = [
      assigns[:class] || "navbar-item",
      "has-text-#{assigns[:color]}": assigns[:color]
    ]

    class =
      case class do
        _ when is_binary(class) ->
          [{class, true}]

        _ when is_list(class) ->
          class

        nil ->
          []
      end

    base_classes ++ class
  end

  defp classes(assigns) do
    has_subitems = slot_assigned?(assigns, :items)
    ["navbar-item", "has-dropdown": has_subitems, "is-hoverable": has_subitems]
  end
end
