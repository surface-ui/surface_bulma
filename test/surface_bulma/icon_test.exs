defmodule Surface.Components.IconTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Icon.FontAwesome, as: FA
  alias SurfaceBulma.Icon.FontAwesome.{Layers, TextLayer, CounterLayer, TextIcon, TextIconText}

  test "basic icon usage" do
    html =
      render_surface do
        ~F"""
        <FA icon="500px" />
        """
      end

    assert html =~
             """
               <span class="icon">
                 <i class="fab fa-500px"></i>
               </span>
             """
  end

  test "set container size" do
    html =
      render_surface do
        ~F"""
        <FA icon="500px" container_size="small" />
        """
      end

    assert html =~
             """
               <span class="icon is-small">
                 <i class="fab fa-500px"></i>
               </span>
             """
  end

  test "set icon size" do
    html =
      render_surface do
        ~F"""
        <FA icon="500px" size="4x" container_size="small" />
        """
      end

    assert html =~
             """
               <span class="icon is-small">
                 <i class="fab fa-500px fa-4x"></i>
               </span>
             """
  end

  test "Layered icons" do
    html =
      render_surface do
        ~F"""
        <Layers container_size="large" >
          <FA icon="camera" size="1x"/>
          <FA icon="ban" size="2x"/>
        </Layers>
        """
      end

    assert html =~
             """
             <span class="icon is-large">
               <span class="fa-layers fa-fw">
                 <span class="icon">
                 <i class="fas fa-camera fa-1x"></i>
               </span>
                 <span class="icon">
                 <i class="fas fa-ban fa-2x"></i>
               </span>
             </span>
             </span>
             """
  end

  test "TextLayered icons" do
    html =
      render_surface do
        ~F"""
        <Layers container_size="large" >
          <FA icon="camera" size="1x"/>
          <TextLayer>Something</TextLayer>
        </Layers>
        """
      end

    assert html =~
             """
             <span class="icon is-large">
               <span class="fa-layers fa-fw">
                 <span class="icon">
                 <i class="fas fa-camera fa-1x"></i>
               </span>
               <span class="fa-layers-text">Something</span>
             </span>
             """
  end

  test "CounterLayered icons" do
    html =
      render_surface do
        ~F"""
        <Layers container_size="large" >
          <FA icon="camera" size="1x"/>
          <CounterLayer>10</CounterLayer>
        </Layers>
        """
      end

    assert html =~
             """
             <span class="icon is-large">
               <span class="fa-layers fa-fw">
                 <span class="icon">
                 <i class="fas fa-camera fa-1x"></i>
               </span>
               <span class="fa-layers-counter">10</span>
             </span>
             """
  end

  test "transformations of the icon" do
    html =
      render_surface do
        ~F"""
        <FA icon="500px" transform="grow-10 left-20"/>
        """
      end

    assert html =~
             """
               <span class="icon">
                 <i data-fa-transform="grow-10 left-20" class="fab fa-500px"></i>
               </span>
             """
  end

  test "setting the primary color" do
    html =
      render_surface do
        ~F"""
        <FA icon="camera" icon_style="duotone" primary_color="blue" />
        """
      end

    assert html =~
             """
               <span class="icon">
                 <i class="fad fa-camera" style="--fa-primary-color: blue"></i>
               </span>
             """
  end

  test "setting the primary opacity and secondary color" do
    html =
      render_surface do
        ~F"""
        <FA icon="camera" icon_style="duotone" secondary_color="blue" primary_opacity={0.6} />
        """
      end

    assert html =~
             """
               <span class="icon">
                 <i class="fad fa-camera" style="--fa-secondary-color: blue; --fa-primary-opacity: 0.6"></i>
               </span>
             """
  end

  test "text icon text" do
    html =
      render_surface do
        ~F"""
        <TextIcon>
        <FA icon="camera"/>
        <TextIconText>Hello</TextIconText>
        </TextIcon>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert Floki.find(parsed, "span.icon-text > span.icon > i") == [
             {"i", [{"class", "fas fa-camera"}], []}
           ]

    assert Floki.find(parsed, "span.icon-text > :not(span.icon)") == [
             {"span", [], ["\n  Hello\n"]}
           ]
  end
end
