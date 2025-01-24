defmodule SurfaceBulma.Link do
  use SurfaceBulma.Component

  prop patch, :string
  prop navigate, :string
  prop href, :string

  @doc "Optional properties to pass to the Phoenix.Component.link component"
  prop props, :map, default: %{}

  prop opts, :keyword, default: []

  use SurfaceBulma.ColorProp
  use SurfaceBulma.ContextClass

  @doc false
  data context_opts, :any, from_context: {SurfaceBulma.Link, :opts}

  slot default

  def render(assigns) do
    assigns =
      assign(assigns, :class, classes(assigns, "has-text-#{assigns[:color]}": assigns[:color]))
      |> update(:opts, fn opts -> Keyword.merge(opts, assigns[:context_opts] || []) end)

    ~F"""
    {#case {@patch, @navigate}}
      {#match {patch, _} when is_binary(patch)}
        <.link {=patch} {...@props} {=@class} {=@opts}>
          <#slot />
        </.link>
      {#match {_, redirect} when is_binary(redirect)}
        <.link navigate={redirect} {...@props} {=@class} {=@opts}>
          <#slot />
        </.link>
      {#match _}
        <.link {=@href} {=@class} {=@opts}><#slot /></.link>
    {/case}
    """
  end
end
