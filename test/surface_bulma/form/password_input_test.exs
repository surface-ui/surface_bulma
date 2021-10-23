defmodule Surface.Components.Form.PasswordInputTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Form.PasswordInput

  test "empty input" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" />
        """
      end

    assert html =~ """
           <div class="field">
             <div class="control">
             <input class="input" id="user_password" name="user[password]" type="password">
             </div>
           </div>
           """
  end

  test "input with atom field" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field={:password} />
        """
      end

    assert html =~ ~r/<input id="user_password" name="user[password]"/
  end

  test "setting the value" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" value="secret" />
        """
      end

    assert html =~ ~r/<input .* value="secret"/
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" class="test" />
        """
      end

    assert html =~ ~r/class="input test"/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" class="primary password" />
        """
      end

    assert html =~ ~r/class="input primary password"/
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" opts={autofocus: "autofocus"} />
        """
      end

    assert html =~ ~r(<input autofocus="autofocus".*>)
  end

  test "events with parent live view as target" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="color" value="secret" click="my_click" />
        """
      end

    assert html =~ ~s(phx-click="my_click")
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" id="secret" name="secret" />
        """
      end

    assert html =~ ~r(<input .* id="secret" name="secret" type="password">)
  end

  test "setting the phx-value-* values" do
    html =
      render_surface do
        ~F"""
        <PasswordInput form="user" field="password" values={a: "one", b: :two, c: 3} />
        """
      end

    assert html =~ """
           <input id="user_password" name="user[password]" phx-value-a="one" phx-value-b="two" phx-value-c="3" type="password">
           """
  end
end
