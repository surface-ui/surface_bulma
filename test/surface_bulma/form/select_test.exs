defmodule SurfaceBulma.Components.Form.SelectTest do
  use SurfaceBulma.ConnCase

  alias SurfaceBulma.Form.Select
  alias Surface.Components.Form

  def wrap_in_field(html, debug \\ false) do
    wrapped = """
      <div class="field">
        <div class="control">
            #{String.trim(html)}
        </div>
    </div>
    """

    if debug, do: IO.puts("wrapped:\n" <> wrapped)
    wrapped
  end

  test "empty select" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" />
        """
      end

    assert html =~ ~s{<select id="user_role" name="user[role]"></select>}
  end

  test "select with atom field" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field={:role} />
        """
      end

    assert html =~ """
           <select id="user_role" name="user[role]"></select>
           """
  end

  test "setting the options" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" options={[Admin: "admin", User: "user"]} />
        """
      end

    assert html =~ """
           <select id="user_role" name="user[role]">\
           <option value="admin">Admin</option>\
           <option value="user">User</option>\
           </select>
           """
  end

  test "setting the class" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" options={[Admin: "admin", User: "user"]} class="select" />
        """
      end

    assert html =~ ~r/class="select"/
  end

  test "setting multiple classes" do
    html =
      render_surface do
        ~F"""
        <Select
          form="user"
          field="role"
          options={[Admin: "admin", User: "user"]}
          class="select primary"
        />
        """
      end

    assert html =~ ~r/class="select primary"/
  end

  test "setting the prompt" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" options={[Admin: "admin", User: "user"]} prompt="Pick a role" />
        """
      end

    assert html =~ """
           <select id="user_role" name="user[role]">\
           <option value="">Pick a role</option>\
           <option value="admin">Admin</option>\
           <option value="user">User</option>\
           </select>
           """
  end

  test "setting the default selected element" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" options={[Admin: "admin", User: "user"]} selected="user" />
        """
      end

    assert html =~ """
           <select id="user_role" name="user[role]">\
           <option value="admin">Admin</option>\
           <option selected value="user">User</option>\
           </select>
           """
  end

  test "passing other options" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" options={[Admin: "admin", User: "user"]} opts={disabled: true} />
        """
      end

    assert html =~ """
           <select disabled id="user_role" name="user[role]">\
           <option value="admin">Admin</option>\
           <option value="user">User</option>\
           </select>
           """
  end

  test "setting id and name through props" do
    html =
      render_surface do
        ~F"""
        <Select form="user" field="role" id="role" name="role" options={[Admin: "admin", User: "user"]} />
        """
      end

    assert html =~ """
           <select id="role" name="role">\
           <option value="admin">Admin</option>\
           <option value="user">User</option>\
           </select>
           """
  end

  test "with form context" do
    html =
      render_surface do
        ~F"""
        <Form for={%{}} as={:user} csrf_token="test">
          <Select form="user" field="role" id="role" name="role" options={[Admin: "admin", User: "user"]}>
            <:left_addon>BLABLABLA</:left_addon>
          </Select>
        </Form>
        """
      end

    assert html =~ """
           <form action="#" method="post">
               <input name="_csrf_token" type="hidden" hidden value="test">
             <div class="field has-addons">
               BLABLABLA
               <div class="control">
             <div class="select">
                 <select id="role" name="role"><option value="admin">Admin</option><option value="user">User</option></select>
             </div>
           </div>
           </div>
           </form>
           """
  end
end
