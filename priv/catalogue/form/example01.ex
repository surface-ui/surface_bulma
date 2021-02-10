defmodule SurfaceBulma.Catalogue.Form.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample form",
    height: "700px"

  alias SurfaceBulma.Form.{Checkbox, RadioButton, Select, TextArea, TextInput}
  alias SurfaceBulma.{Button, ButtonGroup}
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
        <TextInput
          field="name"
          label="Name"
           placeholder="Text input"/>
        <TextInput
          field="username"
          label="Username"/>
        <TextInput
          field="email"
          label="Email" />
        <Select
          field="select"
          options={{[
            "Select dropdown",
            "with options"
            ]}}/>
        <TextArea
          field="message"
          label="Message"
          placeholder="Textarea"
          size="normal"/>
        <Checkbox field="checkbox">
        I agree to the
        <Link to="#">terms and conditions</Link>
        </Checkbox>
        <RadioButton
            field="radio"
            options={{
              ["yes", "no"]
            }}/>
        <ButtonGroup>
          <Button
            type="submit"
            link>
            Submit
          </Button>
          <Button
            type="submit"
            color="light"
            link>
            Submit
          </Button>
        </ButtonGroup>
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
