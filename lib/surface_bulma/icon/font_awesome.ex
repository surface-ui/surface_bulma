defmodule SurfaceBulma.Icon.FontAwesome do
  @moduledoc """
  A component that displays an icon compatible with the FontAwesome icons
  """

  @icon_names :code.priv_dir(:surface_bulma)
              |> Path.join("font-awesome-icons.txt")
              |> File.read!()
              |> String.split("\n")

  @sizes ~w/xs sm lg 2x 3x 4x 5x 6x 7x 8x 9x 10x/
  use SurfaceBulma.Icon,
    icon_sizes: @sizes,
    animations: ~w/spin pulse/,
    icon_names: @icon_names

  @doc """
  Transformations of the icon. Use `rotate-#`, `grow-#`, `shrink-#`, `flip-v`, `flip-h`,
  `right-#`, `left-#`, `up-#`, `down-#` in any combination. 
  Rotations are in degrees, placement and scaling are in 1/16th `em`.
  """
  prop transform, :string

  @doc "Sets the size for the stacking container, if stacking icons"
  prop stack_size, :string, values: @sizes

  @doc "Sets a mask to use with the icon"
  prop mask, :string, values: @icon_names

  @doc "Set the primary color of the icon"
  prop primary_color, :string

  @doc "set the secondary color of the icon"
  prop secondary_color, :string

  @doc "Set the primary opacity of the icon"
  prop primary_opacity, :decimal

  @doc "Set the secondary opacity of the icon"
  prop secondary_opacity, :decimal

  slot default

  @style_attrs ~w/primary_color secondary_color primary_opacity secondary_opacity/a
  def render(assigns) do
    stacking = slot_assigned?(:default)

    style =
      Enum.reduce(@style_attrs, "", fn attr, acc ->
        if value = Map.get(assigns, attr) do
          key = String.replace(to_string(attr), "_", "-")
          acc <> "--fa-#{key}: #{value};"
        else
          acc
        end
      end)

    transforms = (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}

    # The Context will tell the Components in the :default slot 
    # whether to render a container span or not this allows for the stacking behaviour.

    ~H"""
    <Context get={{__MODULE__, container: container}}>
      <span :if={{is_nil(container)}} class={{"icon", "is-#{@container_size}": @container_size}}>
        <span :if={{stacking}} class={{"fa-stack", "fa-#{@stack_size}": @stack_size}} >
          <i :attrs={{transforms}} style={{style}}
            class={{"fas", "fa-#{@icon}", "fa-stack-#{@size}": @size}}></i>
          <Context put={{__MODULE__, container: false}}>

            <slot name="default" />
          </Context>
        </span>

        <i :attrs={{transforms}} :if={{ not stacking }} class={{"fas", "fa-#{@icon}", "fa-#{@size}": @size}} style={{style}} ></i>
      </span>

      <i :attrs={{transforms}} :if={{not is_nil(container) and not container}} 
        class={{"fas", "fa-#{@icon}", "fa-stack-#{@size}": @size}}></i>
    </Context>
    """
  end
end
