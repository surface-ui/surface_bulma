defmodule Surface.Components.ButtonTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Button

  test "creates a <button> with type and class button" do
    html =
      render_surface do
        ~H"""
        <Button>
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button type="button" class="button">
             Ok
           </button>
           """
  end

  test "classes propagate to button" do
    html =
      render_surface do
        ~H"""
        <Button class={{"custom","custom2"}}>
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button type="button" class="custom custom2">
             Ok
           </button>
           """

    html =
      render_surface do
        ~H"""
        <Button class="custom custom2">
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button type="button" class="custom custom2">
             Ok
           </button>
           """
  end

  test "opts propagate to button attrs" do
    html =
      render_surface do
        ~H"""
        <Button opts={{ "data-custom": "custom" }}>
          Ok
        </Button>
        """
      end

    assert html =~ """
           <button data-custom="custom" type="button" class="button">
             Ok
           </button>
           """
  end

  test "aria label" do
    html = render_surface(do: ~H(<Button aria_label="Ok">Ok</Button>))

    assert html =~ """
           <button type="button" aria-label="Ok" class="button">
             Ok
           </button>
           """
  end

  test "prop label" do
    html = render_surface(do: ~H(<Button label="Ok"/>))

    assert html =~ """
           <button type="button" class="button">
             Ok
           </button>
           """
  end

  test "prop color" do
    html = render_surface(do: ~H(<Button color="primary">Ok</Button>))
    assert html =~ ~r/class="(.*)is-primary(.*)"/
  end

  test "prop size" do
    html = render_surface(do: ~H(<Button size="small">Ok</Button>))
    assert html =~ ~r/class="(.*)is-small(.*)"/
  end

  test "propety value" do
    html = render_surface(do: ~H(<Button value="123">Ok</Button>))
    assert html =~ ~r/value="123"/
  end

  test "propety expand" do
    html = render_surface(do: ~H(<Button expand>Ok</Button>))
    assert html =~ ~r/class="(.*)is-fullwidth(.*)"/
  end

  test "propety outlined" do
    html = render_surface(do: ~H(<Button outlined>Ok</Button>))
    assert html =~ ~r/class="(.*)is-outlined(.*)"/
  end

  test "propety rounded" do
    html = render_surface(do: ~H(<Button rounded>Ok</Button>))
    assert html =~ ~r/class="(.*)is-rounded(.*)"/
  end

  test "propety hovered" do
    html = render_surface(do: ~H(<Button hovered>Ok</Button>))
    assert html =~ ~r/class="(.*)is-hovered(.*)"/
  end

  test "propety focused" do
    html = render_surface(do: ~H(<Button focused>Ok</Button>))
    assert html =~ ~r/class="(.*)is-focused(.*)"/
  end

  test "propety active" do
    html = render_surface(do: ~H(<Button active>Ok</Button>))
    assert html =~ ~r/class="(.*)is-active(.*)"/
  end

  test "propety loading" do
    html = render_surface(do: ~H(<Button loading>Ok</Button>))
    assert html =~ ~r/class="(.*)is-loading(.*)"/
  end

  test "propety selected" do
    html = render_surface(do: ~H(<Button selected>Ok</Button>))
    assert html =~ ~r/class="(.*)is-selected(.*)"/
  end
end
