defmodule Surface.Components.IconTest do
  use ExUnit.Case, async: true

  alias SurfaceBulma.Icon.FontAwesome, as: FA, warn: false
  alias SurfaceBulma.Icon.FontAwesome.{Layers, TextLayer, CounterLayer}, warn: false
  import ComponentTestHelper

  test "basic icon usage" do
    code = """
    <FA icon="500px" />
    """

    assert render_live(code) =~ """
           <span class="icon"><i class="fas fa-500px"></i></span>
           """
  end

  test "set container size" do
    code = """
    <FA icon="500px" container_size="small" />
    """

    assert render_live(code) =~ """
           <span class="icon is-small"><i class="fas fa-500px"></i></span>
           """
  end

  test "set icon size" do
    code = """
    <FA icon="500px" size="4x" container_size="small" />
    """

    assert render_live(code) =~
             ~s[<span class="icon is-small"><i class="fas fa-500px fa-4x"></i></span>]
  end

  test "Layered icons" do
    code = """
    <Layers container_size="large" >
      <FA icon="camera" size="1x"/>
      <FA icon="ban" size="2x"/>
    </Layers>
    """

    assert render_live(code) =~
             """
             <span class="icon is-large">
             <span class="fa-layers fa-fw">
             <span class="icon"><i class="fas fa-camera fa-1x"></i></span>
             <span class="icon"><i class="fas fa-ban fa-2x"></i></span>
             </span>
             </span>
             """
             |> String.replace("\n", "")
  end

  test "transformations of the icon" do
    code = """
    <FA icon="500px" transform="grow-10 left-20"/>
    """

    assert render_live(code) =~ """
           <span class="icon"><i data-fa-transform="grow-10 left-20" class="fas fa-500px"></i></span>
           """
  end

  test "setting the primary color" do
    code = """
    <FA icon="camera" icon_style="duotone" primary_color="blue" />
    """

    assert render_live(code) =~ """
           <span class="icon"><i class="fad fa-camera" style="--fa-primary-color: blue"></i></span>
           """
  end

  test "setting the primary opacity and secondary color" do
    code = """
    <FA icon="camera" icon_style="duotone" secondary_color="blue" primary_opacity={{0.6}} />
    """

    assert render_live(code) =~ """
           <span class="icon"><i class="fad fa-camera" style="--fa-secondary-color: blue; --fa-primary-opacity: 0.6"></i></span>
           """
  end
end
