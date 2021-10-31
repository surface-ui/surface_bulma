defmodule SurfaceBulma.Form.InputWrapperTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Form
  alias SurfaceBulma.Form.InputWrapper
  alias Surface.Components.Context

  test "setting correct classes" do
    html =
      render_surface do
        ~F"""
          <InputWrapper has_addons={true} expanded={true} />
        """
      end

    assert html =~ ~r/has-addons/
    assert html =~ ~r/is-expanded/
  end

  test "labels are set correctly" do
    html =
      render_surface do
        ~F"""
        <InputWrapper label="Test" />
        """
      end

    assert html =~ ~r[class="label">\n.*Test\n.*</label>]

    html =
      render_surface do
        ~F"""
        <Context put={SurfaceBulma.Form, is_addon: true}>
          <InputWrapper label="Test" />
        </Context>
        """
      end

    refute html =~ ~r[class="label">\n.*Test\n.*</label>]
  end

  defmodule TestInput do
    use SurfaceBulma.Form.InputBase
    use SurfaceBulma.Form.InputIconBase
    use SurfaceBulma.Form.InputAddonBase

    import SurfaceBulma.Form.InputWrapper
    prop field, :any

    def render(assigns) do
      ~F"""
      <InputWrapper field={@field} label={@label} icon_right={@icon_right} has_addons={has_addons?(assigns)} :let={form: form}>
        <:left_addon>{render_left_addon(assigns)}</:left_addon>
        TestInput{form && form.id}
        <:right_addon>{render_right_addon(assigns)}</:right_addon>
      </InputWrapper>
      """
    end
  end

  test "addons can be set" do
    html =
      render_surface do
        ~F"""
        <TestInput label="Test">
          <:left_addon><TestInput label="left" /></:left_addon>
          <:right_addon><TestInput label="right" /></:right_addon>
        </TestInput>
        """
      end

    assert html =~ """

             <div class="field has-addons">
             <div class="control">
             TestInput
             </div>
             <div class="control">
             TestInput
             </div>
             <div class="control">
             TestInput
             </div>
           </div>
           """
  end

  test "multiple addons can be set" do
    html =
      render_surface do
        ~F"""
        <TestInput label="parent">
          <:left_addon><TestInput label="left" /></:left_addon>
          <:left_addon><TestInput label="nested left" /></:left_addon>
        </TestInput>
        """
      end

    assert html =~ """

             <div class="field has-addons">
             <div class="control">
             TestInput
             </div>
             <div class="control">
             TestInput
             </div>
             <div class="control">
             TestInput
             </div>
           </div>
           """
  end

  test "icons for addons are set" do
    html =
      render_surface do
        ~F"""
        <TestInput label="parent">
          <:left_addon><TestInput label="left" icon_right="calendar" /></:left_addon>
          <:left_addon><TestInput label="nested left" /></:left_addon>
        </TestInput>
        """
      end
    assert html =~ ~r/calendar/
  end

  defmodule User do
    use Ecto.Schema
    import Ecto.Changeset

    schema "user" do
      field(:name, :string)
      field(:date, :date)
      field(:checked, :boolean)
      field(:color, :string)
      field(:password, :string)
    end

    def changeset(changeset, params \\ %{}) do
      changeset
      |> cast(params, [:name, :date, :checked, :color, :password])
    end
  end

  describe "common_text_input_fields" do
    test "valid changeset has correct icon" do
      html =
        render_surface do
          ~F"""
          <Form csrf_token={false} for={User.changeset(%User{}, %{name: "Test"})}>
            <TestInput field={:name} />
          </Form>
          """
        end

      assert html =~ """

             <form action="#" method="post">
               <div class="field">
               <div class="control has-icons-right">
               TestInput
               <span class="icon has-text-success is-small is-right">
                 <i class="fas fa-check"></i>
               </span>
               </div>
             </div>
             </form>
             """
    end

    test "incorrect changeset has icon displayed" do
      html =
        render_surface do
          ~F"""
          <Form csrf_token={false} for={User.changeset(%User{}, %{date: "Test"})}>
            <TestInput field={:date} />
          </Form>
          """
        end

      assert html =~ """
             <form action="#" method="post">
               <div class="field">
               <div class="control has-icons-right">
               TestInput
               <span class="icon has-text-danger is-small is-right">
                 <i class="fas fa-exclamation-triangle"></i>
               </span>
               </div>
             </div>
             </form>
             """
    end

    test "left icons and right icons" do
      html =
        render_surface do
          ~F"""
          <InputWrapper icon_left="check" icon_right="right_check" />
          """
        end

      assert html =~ ~r/has-icons-right has-icons-left/
      assert html =~ ~r/check/
      assert html =~ ~r/right_check/
    end

    test "right icon is not displayed with error" do
      html =
        render_surface do
          ~F"""
          <Form csrf_token={false} for={User.changeset(%User{}, %{date: "Test"})}>
            <TestInput field={:date} icon_right="right_test"/>
          </Form>
          """
        end

      refute html =~ ~r/fa-exclamation-triangle/
      assert html =~ ~r/right_test/

      html =
        render_surface do
          ~F"""
          <Form csrf_token={false} for={User.changeset(%User{}, %{name: "Test"})}>
            <TestInput field={:name} icon_right="right_test"/>
          </Form>
          """
        end

      refute html =~ ~r/fa-check/
      assert html =~ ~r/right_test/
    end
  end

  defmodule Slot do
  use Surface.Component, slot: "test"
  slot default
  def render(assigns) do
    ~F"""
    <Context put={is_addon: true}>
      <#slot />
    </Context>
    """
  end
end

defmodule Parent do
  use Surface.Component
  slot test
  def render(assigns) do
    ~F"""
    <#slot name="test" />
    """
  end
end
end
