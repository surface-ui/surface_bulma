defmodule SurfaceBulma.Catalogue.Form.Example03 do
  @moduledoc ""
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Horizontal form groups",
    height: "500px",
    direction: "vertical"

  alias SurfaceBulma.Form.{
    FieldWrapper,
    HorizontalControlGroup,
    RadioButton,
    Select,
    TextArea,
    TextInput
  }

  alias SurfaceBulma.Button
  alias Surface.Components.Form
  alias SurfaceBulma.Catalogue.Form.SampleModel

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{
        "username" => "bulma",
        "email" => "hello@"
      })
      |> Map.put(:action, :insert)

  def render(assigns) do
    ~F"""
    <Form for={@changeset} change="change" submit="submit" opts={autocomplete: "off"}>
      <HorizontalControlGroup label="From">
        <TextInput field={:example_03_name} placeholder="Name" icon_left="user" expanded />
        <TextInput field={:example_03_email} icon_left="envelope" expanded value="alex@smith.com" />
      </HorizontalControlGroup>
      <HorizontalControlGroup>
        <FieldWrapper help_text="Do not enter the first zero">
          <TextInput field={:example_03_phone} placeholder="Your phone number" expanded>
            <:left_addon>
              <Button static>+44</Button>
            </:left_addon>
          </TextInput>
        </FieldWrapper>
      </HorizontalControlGroup>
      <HorizontalControlGroup label="Department">
        <Select
          field={:example_03_department}
          options={[
            "Business development",
            "Marketing",
            "Sales"
          ]}
        />
      </HorizontalControlGroup>
      <HorizontalControlGroup label="Already a member?">
        <RadioButton field={:example_03_member} options={["yes", "no"]} />
      </HorizontalControlGroup>
      <HorizontalControlGroup label="Subject">
        <TextInput field={:example_03_subject} placeholder="e.g. Partnership opportunity" expanded />
      </HorizontalControlGroup>
      <HorizontalControlGroup label="Question">
        <TextArea field={:example_03_question} placeholder="Explain how we can help you" expanded />
      </HorizontalControlGroup>
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
