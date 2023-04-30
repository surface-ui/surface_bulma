defmodule SurfaceBulma.Catalogue.Level.Example01 do
  @moduledoc """

  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Level,
    catalogue: SurfaceBulma.Catalogue,
    title: "Sample level",
    height: "100px",
    direction: "vertical"

  alias SurfaceBulma.Level
  alias SurfaceBulma.{SubTitle, Form.TextInput, Button}

  def render(assigns) do
    ~F"""
    <Level>
      <:left><SubTitle size="5"><strong>123</strong> posts</SubTitle></:left>
      <:left>
        <TextInput field={:level_input} placeholder="Find a post">
          <:right_addon><Button color="primary">Search</Button></:right_addon>
        </TextInput>
      </:left>
      <:right><p><strong>All</strong></p></:right>
      <:right><a>Published</a></:right>
      <:right><a>Drafts</a></:right>
      <:right><a>Deleted</a></:right>
    </Level>
    """
  end
end
