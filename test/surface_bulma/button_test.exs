defmodule Surface.Components.ButtonTest do
  use ExUnit.Case, async: true

  alias SurfaceBulma.Button, warn: false
  import ComponentTestHelper

  test "creates a <button> with type and class button" do
    code = """
    <Button>
      Ok
    </Button>
    """

    assert render_live(code) =~ """
           <button type="button" class="button">
             Ok
           </button>
           """
  end

  test "prop label" do
    code = ~S(<Button label="Ok"/>)

    assert render_live(code) =~ """
           <button type="button" class="button">
             Ok
           </button>
           """
  end

  test "prop color" do
    code = ~S(<Button color="primary">Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-primary(.*)"/
  end

  test "prop size" do
    code = ~S(<Button size="small">Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-small(.*)"/
  end

  test "propety expand" do
    code = ~S(<Button expand>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-fullwidth(.*)"/
  end

  test "propety outlined" do
    code = ~S(<Button outlined>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-outlined(.*)"/
  end

  test "propety rounded" do
    code = ~S(<Button rounded>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-rounded(.*)"/
  end

  test "propety hovered" do
    code = ~S(<Button hovered>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-hovered(.*)"/
  end

  test "propety focused" do
    code = ~S(<Button focused>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-focused(.*)"/
  end

  test "propety active" do
    code = ~S(<Button active>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-active(.*)"/
  end

  test "propety loading" do
    code = ~S(<Button loading>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-loading(.*)"/
  end

  test "propety selected" do
    code = ~S(<Button selected>Ok</Button>)
    assert render_live(code) =~ ~r/class="(.*)is-selected(.*)"/
  end
end
