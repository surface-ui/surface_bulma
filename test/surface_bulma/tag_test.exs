defmodule Surface.Components.TagTest do
  use ExUnit.Case, async: true

  alias SurfaceBulma.Tag, warn: false
  import ComponentTestHelper

  test "create a tag" do
    code = """
    <Tag>tag</Tag>
    """

    assert render_live(code) =~ """
           <span class="tag">
             tag
           </span>
           """
  end

  test "create a tag according to the given label" do
    code = """
    <Tag label="tag" />
    """

    assert render_live(code) =~ """
           <span class="tag">
             tag
           </span>
           """
  end

  test "prop color" do
    code = """
    <Tag label="tag" color="primary" />
    """

    assert render_live(code) =~ """
           <span class="tag is-primary">
             tag
           </span>
           """
  end

  test "prop size" do
    code = """
    <Tag label="tag" size="normal" />
    """

    assert render_live(code) =~ """
           <span class="tag is-normal">
             tag
           </span>
           """
  end

  test "prop light" do
    code = """
    <Tag label="tag" color="primary" light />
    """

    assert render_live(code) =~ """
           <span class="tag is-primary is-light">
             tag
           </span>
           """
  end

  test "prop rounded" do
    code = """
    <Tag label="tag" color="primary" rounded />
    """

    assert render_live(code) =~ """
           <span class="tag is-primary is-rounded">
             tag
           </span>
           """
  end
end
