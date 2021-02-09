defmodule SurfaceBulma.Catalogue.Form.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Horizontal form groups",
    height: "700px"

  alias SurfaceBulma.Form.{
    Checkbox,
    RadioButton,
    Select,
    TextArea,
    TextField,
    TextFieldLeftAddon,
    TextFieldRightAddon
  }

  alias SurfaceBulma.{Button, ButtonGroup, Title}
  alias Surface.Components.{Link, Form}
  alias SurfaceBulma.Catalogue.Form.SampleModel

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{
        "username" => "bulma",
        "email" => "hello@"
      })
      |> Map.put(:action, :insert)

  def render(assigns) do
    ~H"""
      <Form
        for={{ @changeset }}
        change={{"change"}}
        submit={{"submit"}}
        opts={{ autocomplete: "off" }}>

      </Form>
    """
  end

  def handle_event("change", %{"sample_model" => changes}, socket) do
    cs =
      SampleModel.changeset(%SampleModel{}, changes)
      |> Map.put(:action, :insert)

    socket = assign(socket, :changeset, cs)
    {:noreply, socket}
  end
end
