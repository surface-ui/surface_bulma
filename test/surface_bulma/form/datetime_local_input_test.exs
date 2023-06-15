defmodule Surface.Components.Form.DateTimeLocalInputTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Form.DateTimeLocalInput

  test "empty input" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" />
        """
      end

    assert html =~ ~r/id="order_completed_at"/
    assert html =~ ~r/name="order\[completed_at\]"/
    assert html =~ ~r/type="datetime-local"/
  end

  test "setting the value" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" value="2020-05-05T19:30" />
        """
      end

    assert html =~ ~r/value="2020-05-05T19:30"/
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" class="test" />
        """
      end

    assert html =~ ~r/class="input test"/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" class="primary test" />
        """
      end

    assert html =~ ~r/class="input primary test"/
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" opts={autofocus: "autofocus"} />
        """
      end

    assert html =~ ~r/autofocus="autofocus"/
  end

  test "events with parent live view as target" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="order" field="completed_at" value="2020-05-05T19:30" click="my_click" />
        """
      end

    assert html =~ ~s(phx-click="my_click")
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="user" field="birth" id="birthday" name="birthday" />
        """
      end

    assert html =~ ~r/id="birthday"/
    assert html =~ ~r/name="birthday"/
  end

  test "setting the phx-value-* values" do
    html =
      render_surface do
        ~F"""
        <DateTimeLocalInput form="user" field="birth" values={a: "one", b: :two, c: 3} />
        """
      end

    assert html =~ ~r/phx-value-a="one" phx-value-b="two" phx-value-c="3"/
  end
end
