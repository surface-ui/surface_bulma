defmodule SurfaceBulma.Link do
  use SurfaceBulma.Component
  alias Surface.Components.LivePatch
  alias Surface.Components.LiveRedirect

  include(LivePatch, except: [:to])

  prop patch, :string
  prop navigate, :string
  prop href, :string

  use SurfaceBulma.ContextClass
  data context_opts, :any, from_context: {SurfaceBulma.Link, :opts}
  slot default

  def render(assigns) do
    props = included_props(assigns, LivePatch)
    {opts, props} = Map.pop(props, :opts, [])
    assigns = set_classes(assigns)

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

  defp set_classes(assigns) do
    context_class =
      case assigns[:context_class] do
        class when is_binary(class) ->
          [{class, true}]

        classes when is_list(classes) ->
          classes

        nil ->
          []
      end

    assign(
      assigns,
      :class,
      [assigns[:class], "has-text-#{assigns[:color]}": assigns[:color]] ++ context_class
    )
  end
end
