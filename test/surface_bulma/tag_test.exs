defmodule Surface.Components.TagTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Tag

  test "create a tag" do
    html =
      render_surface do
        ~H"""
        <Tag>tag</Tag>
        """
      end

    assert html =~ """
           <span class="tag">
             tag
           </span>
           """
  end

  test "create a tag according to the given label" do
    html =
      render_surface do
        ~H"""
        <Tag label="tag" />
        """
      end

    assert html =~ """
           <span class="tag">
             tag
           </span>
           """
  end

  test "prop color" do
    html =
      render_surface do
        ~H"""
        <Tag label="tag" color="primary" />
        """
      end

    assert html =~ """
           <span class="tag is-primary">
             tag
           </span>
           """
  end

  test "prop size" do
    html =
      render_surface do
        ~H"""
        <Tag label="tag" size="normal" />
        """
      end

    assert html =~ """
           <span class="tag is-normal">
             tag
           </span>
           """
  end

  test "prop light" do
    html =
      render_surface do
        ~H"""
        <Tag label="tag" color="primary" light />
        """
      end

    assert html =~ """
           <span class="tag is-primary is-light">
             tag
           </span>
           """
  end

  test "prop rounded" do
    html =
      render_surface do
        ~H"""
        <Tag label="tag" color="primary" rounded />
        """
      end

    assert html =~ """
           <span class="tag is-primary is-rounded">
             tag
           </span>
           """
  end
end
