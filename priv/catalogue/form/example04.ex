defmodule SurfaceBulma.Catalogue.Form.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Various form controls",
    height: "500px"

  alias SurfaceBulma.Form.{
    ColorInput,
    DateInput,
    DateTimeLocalInput,
    TextInputRightAddon
  }

  alias SurfaceBulma.{Button}
  alias Surface.Components.{Form}
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
    <ColorInput
          field="example_04_color"
          label="Color"
           placeholder="Text input"
           value="#c33c3c">
           <TextInputRightAddon>
           <Button color="primary" >Select</Button>
           </TextInputRightAddon>
    </ColorInput>
    <DateInput
          field="example_04_date"
          label="Datetime local"/>
    <DateTimeLocalInput
    field="example_04_datetime_local"
    label="Date"
    step="3600"/>
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
