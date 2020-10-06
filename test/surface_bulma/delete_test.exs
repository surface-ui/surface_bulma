defmodule Surface.Components.DeleteTest do
  use ExUnit.Case, async: true

  alias SurfaceBulma.Delete, warn: false
  import ComponentTestHelper

  test "creates a link element with class delete" do
    code = """
    <Delete />
    """
    assert render_live(code) =~ ~s(<a class="delete"></a>)
  end

  test "prop size" do
    code = """
    <Delete size="small"/>
    """
    assert render_live(code) =~ ~s(<a class="delete is-small"></a>)
  end
end
