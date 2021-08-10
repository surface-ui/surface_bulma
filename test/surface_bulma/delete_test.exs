defmodule Surface.Components.DeleteTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Delete

  test "creates a link element with class delete" do
    html =
      render_surface do
        ~F"""
        <Delete />
        """
      end

    assert html =~ """
           <a class="delete">
           </a>
           """
  end

  test "prop size" do
    html =
      render_surface do
        ~F"""
        <Delete size="small"/>
        """
      end

    assert html =~ """
           <a class="delete is-small">
           </a>
           """
  end
end
