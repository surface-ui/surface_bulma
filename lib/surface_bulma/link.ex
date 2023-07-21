defmodule SurfaceBulma.Link do
  use SurfaceBulma.Component
  alias Surface.Components.LivePatch
  alias Surface.Components.LiveRedirect

  include(LivePatch, except: [:to])

  prop patch, :string
  prop navigate, :string
  prop href, :string

  use SurfaceBulma.ColorProp
  use SurfaceBulma.ContextClass
  data context_opts, :any, from_context: {SurfaceBulma.Link, :opts}
  slot default

  def render(assigns) do
    props = included_props(assigns, LivePatch)
    {opts, props} = Map.pop(props, :opts, [])

    assigns =
      assign(assigns, :class, classes(assigns, "has-text-#{assigns[:color]}": assigns[:color]))

    ~F"""
    {#case {@patch, @navigate}}
      {#match {patch, _} when is_binary(patch)}
        <LivePatch {...props} {=@class} opts={Keyword.merge(opts, @context_opts || [])}>
          <#slot />
        </LivePatch>
      {#match {_, redirect} when is_binary(redirect)}
        <LiveRedirect {...props} {=@class} opts={Keyword.merge(opts, @context_opts || [])}>
          <#slot />
        </LiveRedirect>
      {#match _}
        <a {=@href} {=@class}><#slot /></a>
    {/case}
    """
  end
end
