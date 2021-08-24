defmodule SurfaceBulma.Components.FormTest do
  use SurfaceBulma.ConnCase
  alias SurfaceBulma.Form
  alias SurfaceBulma.Form.TextInput

  defmodule User do
    use Ecto.Schema

    schema "user" do
      field(:name, :string)
      field(:date, :date)
      field(:checked, :boolean)
      field(:color, :string)
      field(:password, :string)
    end
  end

  defmodule ViewWithForm do
    use Surface.LiveView

    data changeset, :any

    def render(assigns) do
      ~F"""
      <Form for={@changeset} action="#" csrf_token="test" as={:user} :let={form: f}>
        <TextInput field={:name} />
        {Enum.map(Keyword.get_values(f.source.errors, :name), fn {msg, _opts} -> ["Name ", msg] end)}
      </Form>
      """
    end

    def mount(_params, session, socket) do
      {:ok, assign(socket, changeset: session["changeset"])}
    end
  end

  test "form as an atom" do
    html =
      render_surface do
        ~F"""
        <Form for={:user} action="#" csrf_token="test">
        </Form>
        """
      end

    assert html =~ """
           <form action="#" method="post">\
           <input name="_csrf_token" type="hidden" value="test">
           </form>
           """
  end
end
