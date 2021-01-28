defmodule Surface.Components.IconTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Icon.FontAwesome, as: FA
  alias SurfaceBulma.Icon.FontAwesome.{Layers, TextLayer, CounterLayer}

  test "basic icon usage" do
    html =
      render_surface do
        ~H"""
        <FA icon="500px" />
        """
      end

    assert code =~ """
           <span class="icon"><i class="fas fa-500px"></i></span>
           """
  end

  test "set container size" do
    html =
      render_surface do
        ~H"""
        <FA icon="500px" container_size="small" />
        """
      end

    assert code =~ """
           <span class="icon is-small"><i class="fas fa-500px"></i></span>
           """
  end

  test "set icon size" do
    html =
      render_surface do
        ~H"""
        <FA icon="500px" size="4x" container_size="small" />
        """
      end

    assert code =~
             ~s[<span class="icon is-small"><i class="fas fa-500px fa-4x"></i></span>]
  end

  test "Layered icons" do
    html =
      render_surface do
        ~H"""
        <Layers container_size="large" >
          <FA icon="camera" size="1x"/>
          <FA icon="ban" size="2x"/>
        </Layers>
        """
      end

    assert code =~
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
    html =
      render_surface do
        ~H"""
        <FA icon="500px" transform="grow-10 left-20"/>
        """
      end

    assert code =~ """
           <span class="icon"><i data-fa-transform="grow-10 left-20" class="fas fa-500px"></i></span>
           """
  end

  test "setting the primary color" do
    html =
      render_surface do
        ~H"""
        <FA icon="camera" icon_style="duotone" primary_color="blue" />
        """
      end

    assert code =~ """
           <span class="icon"><i class="fad fa-camera" style="--fa-primary-color: blue"></i></span>
           """
  end

  test "setting the primary opacity and secondary color" do
    html =
      render_surface do
        ~H"""
        <FA icon="camera" icon_style="duotone" secondary_color="blue" primary_opacity={{0.6}} />
        """
      end

    assert code =~ """
           <span class="icon"><i class="fad fa-camera" style="--fa-secondary-color: blue; --fa-primary-opacity: 0.6"></i></span>
           """
  end
end
