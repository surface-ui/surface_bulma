defmodule SurfaceBulma.Catalogue.Form.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Various form controls",
    height: "1000px"

  alias SurfaceBulma.Form.{
    ColorInput,
    DateInput,
    DateTimeLocalInput,
    NumberInput,
    PasswordInput,
    RangeInput,
    Select,
    TextInputRightAddon
  }

  alias SurfaceBulma.{Button}
  alias Surface.Components.{Form}
  alias SurfaceBulma.Catalogue.Form.SampleModel

  data(changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{
        "username" => "bulma",
        "email" => "hello@"
      })
      |> Map.put(:action, :insert)
  )

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
      step="3600"
      />
    <Select
      field="example_04_multiple_select"
      options={{
        [
          "Option 1",
          "Option 2",
          "Option 3"
        ]
      }}
      multiple
      expanded
      rounded/>
      <NumberInput
        field="example_04_number"
        step="5"/>
      <PasswordInput
        field="example_04_password"
        placeholder="Your password"
        icon_left="key"/>
      <RangeInput
        field="example_04_range"
        min="0"
        max="10"
        value="7"
        label="Range"/>
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
