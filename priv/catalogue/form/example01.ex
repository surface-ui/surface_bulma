defmodule SurfaceBulma.Catalogue.Form.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample form",
    height: "1000px",
    direction: "vertical"

  alias SurfaceBulma.Form.{Checkbox, TextArea, TextField}
  alias Surface.Components.Form
  alias SurfaceBulma.Catalogue.Form.SampleModel

  data changeset, :map, default: SampleModel.changeset(%SampleModel{}, %{})

  prop checkbox_options, :list, default: []

  def render(assigns) do
    ~H"""
    <Form for={{ @changeset }} change={{"change"}} submit={{"submit"}} opts={{ autocomplete: "off" }}>
        <TextField field="name" label="Name" placeholder="John Doe"/>
        <TextArea
          field="life_history"
          label="Life history"
          placeholder="Lorem ipsum..."
          size="normal"
          rows="5"/>
        <Checkbox field="checkbox" label="Long checkbox-text"/>
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
