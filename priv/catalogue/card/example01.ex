defmodule SurfaceBulma.Catalogue.Card.Example01 do
  @moduledoc """
  Example using all of the available sub-components (Header, Image, Footer).
  """

  use Surface.Catalogue.Example,
    subject: SurfaceBulma.Card,
    catalogue: SurfaceBulma.Catalogue,
    height: "800px",
    title: "All Sub-Components (Header, Image, Footer)"

  alias SurfaceBulma.Icon

  def render(assigns) do
    ~F"""
    <Card>
      <Card.Header>
        <Card.Header.Title>
          This is the title
        </Card.Header.Title>
        <Card.Header.Icon>
          <Icon.FontAwesome icon="user-circle" />
        </Card.Header.Icon>
      </Card.Header>
      <Card.Image>
        <figure class="image is-4by3">
          <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
        </figure>
      </Card.Image>

      <div class="content">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.
        <a href="#">@bulmaio</a>. <a href="#">#css</a> <a href="#">#responsive</a>
        <br>
        <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
      </div>

      <Card.Footer>
        <Card.FooterItem><a href="#">Item 1</a></Card.FooterItem>
        <Card.FooterItem><a href="#">Item 2</a></Card.FooterItem>
        <Card.FooterItem><a href="#">Item 3</a></Card.FooterItem>
      </Card.Footer>
    </Card>
    """
  end
end
