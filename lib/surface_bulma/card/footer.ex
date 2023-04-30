defmodule SurfaceBulma.Card.Footer do
  use Surface.Component

  @moduledoc """
  The Card.Footer component acts as a list of for several Card.FooterItem elements

  ```elixir
  <Card.Footer>
    <Card.FooterItem><a href="#">...</a></Card.FooterItem>
    <Card.FooterItem><a href="#">...</a></Card.FooterItem>
    <Card.FooterItem><a href="#">...</a></Card.FooterItem>
  </Card.Footer>
  ```
  """

  @doc "Multi-purpose container for any other element"
  slot(footer_items, required: true)

  def render(assigns) do
    ~F"""
    <footer class="card-footer">
      {#for item <- @footer_items}
        <span class="card-footer-item">
          <#slot {item} />
        </span>
      {/for}
    </footer>
    """
  end
end
