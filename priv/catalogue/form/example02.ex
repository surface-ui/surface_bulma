defmodule SurfaceBulma.Catalogue.Form.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Form addons",
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

  alias SurfaceBulma.{Button, Title}
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
      <Title size="4">Some simple addon fields</Title>
      <TextField
        field="addon_dummy"
        placeholder="Find a repository">
        <TextFieldRightAddon>
        <Button color="info">Search</Button>
        </TextFieldRightAddon>
      </TextField>

      <TextField
        field="addon_dummy"
        placeholder="Your email">
        <TextFieldRightAddon>
        <Button static>@gmail.com</Button>
        </TextFieldRightAddon>
      </TextField>

      <Title size="4">..with dropdowns</Title>

      <TextField
        field="addon_dummy"
        placeholder="Amount of money"
        >
        <TextFieldLeftAddon>
        <Select
          field="select"
          options={{[
            "$",
            "£",
            "€"
            ]}}/>
        </TextFieldLeftAddon>
        <TextFieldRightAddon>
        <Button>Transfer</Button>
        </TextFieldRightAddon>
      </TextField>

      <Title size="4">
        ..with dropdowns and expanded
      </Title>
      <TextField
      field="addon_dummy"
      placeholder="Amount of money"
      expanded
      >
      <TextFieldLeftAddon>
      <Select
        field="select"
        options={{[
          "$",
          "£",
          "€"
          ]}}/>
      </TextFieldLeftAddon>
      <TextFieldRightAddon>
      <Button>Transfer</Button>
      </TextFieldRightAddon>
    </TextField>
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
