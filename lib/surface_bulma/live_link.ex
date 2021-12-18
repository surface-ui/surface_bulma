defmodule SurfaceBulma.Link do
  use SurfaceBulma.Component
  alias Surface.Components.LivePatch
  alias Surface.Components.LiveRedirect

  include(LivePatch, except: [:to])

  prop patch, :string
  prop navigate, :string
  prop href, :string
  slot default

  def render(assigns) do
    props = included_props(assigns)
    {opts, props} = Map.pop(props, :opts, [])

    ~F"""
    <Context get={SurfaceBulma.Link, link_class: class}
      get={SurfaceBulma.Link, opts: context_opts}>
      {#case {@patch, @navigate}}
        {#match {patch, _} when is_binary(patch)}
          <LivePatch {...props} class={classes(assigns, class)} 
            opts={Keyword.merge(opts, context_opts || [])}>
            <#slot />
          </LivePatch>
        {#match {_, redirect} when is_binary(redirect)}
          <LiveRedirect {...props} class={classes(assigns, class)} 
            opts={Keyword.merge(opts, context_opts || [])}>
            <#slot />
          </LiveRedirect>
        {#match _}
          <a href={@href} class={classes(assigns, class)}><#slot /></a>
      {/case}
    </Context>
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
end
