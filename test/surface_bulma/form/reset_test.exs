defmodule Surface.Components.Form.ResetTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Form.Reset

  test "empty reset" do
    html =
      render_surface do
        ~F"""
        <Reset />
        """
      end

    assert html =~ ~r/value="Reset"/
    assert html =~ ~r/type="reset"/
    assert html =~ ~r/class="button"/
  end

  test "setting the value" do
    html =
      render_surface do
        ~F"""
        <Reset value="ResetTheForm" />
        """
      end

    assert html =~ ~r/value="ResetTheForm"/
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <Reset class="button2" />
        """
      end

    assert html =~ ~r/class="button button2"/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <Reset class="primary" />
        """
      end

    assert html =~ ~r/class="button primary"/
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <Reset opts={autofocus: "autofocus"} />
        """
      end

    assert html =~ ~r/autofocus="autofocus"/
  end

  test "events with parent live view as target" do
    html =
      render_surface do
        ~F"""
        <Reset value="ResetTheForm" click="my_click" />
        """
      end

    assert html =~ ~s(phx-click="my_click")
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <Reset id="countdown" name="countdown" />
        """
      end

    assert html =~ ~r/name="countdown"/
  end

  test "setting the phx-value-* values" do
    html =
      render_surface do
        ~F"""
        <Reset values={a: "one", b: :two, c: 3} />
        """
      end

    assert html =~ ~r/phx-value-a="one" phx-value-b="two" phx-value-c="3"/
  end
end
