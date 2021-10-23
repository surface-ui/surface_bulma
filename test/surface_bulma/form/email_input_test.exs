defmodule SurfaceBulma.Components.Form.EmailInputTest do
  use SurfaceBulma.ConnCase
  alias SurfaceBulma.Form.EmailInput
  
  test "email input is rendered properly" do
    html = render_surface do
      ~F"""
      <EmailInput form="user" field="email" />
      """
      end

      assert html =~ ~r/<input .* type="email"/
  end
end
