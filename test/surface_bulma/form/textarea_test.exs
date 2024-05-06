defmodule Surface.Components.Form.TextAreaTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Form.TextArea

  test "empty textarea" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" />
        """
      end

    assert html =~ ~r/id="user_summary" name="user\[summary\]"/
  end

  test "textarea with atom field" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field={:summary} />
        """
      end

    assert html =~ ~r/id="user_summary" name="user\[summary\]"/
  end

  test "setting the value" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" value="some content" />
        """
      end

    assert html =~ """
           some content</textarea>
           """
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" class="test" />
        """
      end

    assert html =~ ~r/test/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" class="test primary" />
        """
      end

    assert html =~ ~r/test primary"/
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" opts={autofocus: "autofocus"} />
        """
      end

    assert html =~ ~r/autofocus="autofocus"/
  end

  test "events with parent live view as target" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" click="my_click" />
        """
      end

    assert html =~ ~s(phx-click="my_click")
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" id="blog_summary" name="blog_summary" />
        """
      end

    assert html =~ ~r/id="blog_summary" name="blog_summary"/
  end

  test "setting the phx-value-* values" do
    html =
      render_surface do
        ~F"""
        <TextArea form="user" field="summary" values={a: "one", b: :two, c: 3} />
        """
      end

    assert html =~ ~r/phx-value-a="one" phx-value-b="two" phx-value-c="3"/
  end
end
