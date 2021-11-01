defmodule SurfaceBulma.Catalogue.Form.Example02 do
  @moduledoc ""
  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Form,
    catalogue: SurfaceBulma.Catalogue,
    title: "Form addons",
    height: "700px"

  alias SurfaceBulma.Form.{
    Select,
    TextInput
  }

  alias SurfaceBulma.{Button, Title}
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
    ~F"""
      <Form
        for={@changeset}
        change={"change"}
        submit={"submit"}
        opts={autocomplete: "off"}>
      <Title size="4">Some simple addon fields</Title>
      <TextInput
        field={:example_02_addon_dummy1}
        placeholder="Find a repository">
        <:right_addon>
        <Button color="info">Search</Button>
        </:right_addon>
      </TextInput>

      <TextInput
        field={:example_02_addon_dummy2}
        placeholder="Your email">
        <:right_addon>
        <Button static>@gmail.com</Button>
        </:right_addon>
      </TextInput>

      <Title size="4">..with dropdowns</Title>

      <TextInput
        field={:example_02_addon_dummy3}
        placeholder="Amount of money"
        >
        <:left_addon>
        <Select
          field={:example_02_select_dummy1}
          options={[
            "$",
            "£",
            "€"
            ]}/>
        </:left_addon>
        <:right_addon>
        <Button>Transfer</Button>
        </:right_addon>
      </TextInput>

      <Title size="4">
        ..with dropdowns and expanded
      </Title>
      <TextInput
      field={:example_02_addon_dummy4}
      placeholder="Amount of money"
      expanded
      >
      <:left_addon>
      <Select
        field={:example_02_select_dummy2}
        options={[
          "$",
          "£",
          "€"
          ]}/>
      </:left_addon>
      <:right_addon>
      <Button>Transfer</Button>
      </:right_addon>
    </TextInput>
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
