defmodule Surface.Components.DropdownTest do
  use SurfaceBulma.ConnCase, async: true
  alias SurfaceBulma.Dropdown

  @bulma_container_class "dropdown"
  @bulma_trigger_class "dropdown-trigger"
  @bulma_menu_class "dropdown-menu"
  @bulma_content_class "dropdown-content"
  @bulma_item_class "dropdown-item"
  @bulma_divider_class "dropdown-divider"
  @bulma_active_class "is-active"
  @bulma_hoverable_class "is-hoverable"
  @bulma_up_class "is-up"
  @bulma_right_class "is-right"


  test "renders the menu" do
    current_item = "current item"
    link_item = "link item"

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <Dropdown.LinkItem to="#">{link_item}</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    tree = Floki.parse_document!(html)

    current_item_contents =
      tree
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_trigger_class)
      |> Floki.raw_html()

    dropdown_item_contents =
      tree
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_content_class)
      |> Floki.find("." <> @bulma_item_class)
      |> Floki.raw_html()

      assert current_item_contents =~ current_item
      assert dropdown_item_contents =~ link_item
  end

  test "menu is hidden by default" do
    current_item = "current item"
    link_item = "link item"

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <Dropdown.LinkItem to="#">{link_item}</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    refute html =~ @bulma_active_class
  end

  test "renders arbitrary number of items" do
    current_item = "current item"
    link_items = ["link item 1", "link item 2", "link item 3"]

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <:menu_items>
          {#for item <- link_items}
            <Dropdown.LinkItem to="#">{item}</Dropdown.LinkItem>
          {/for}
          </:menu_items>
        </Dropdown>
        """
      end

    items =
      Floki.parse_document!(html)
      |> Floki.find("." <> @bulma_item_class)

    assert length(items) == length(link_items)

    Enum.zip(link_items, items)
    |> Enum.each(fn {link_item, item} -> assert Floki.text(item) =~ link_item end)
  end

  test "item can be an anchor or div" do
    current_item = "current item"
    link_item = "link item"

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <Dropdown.LinkItem to="#">{link_item}</Dropdown.LinkItem>
        </Dropdown>
        """
      end

      link =
        html
        |> Floki.parse_document!()
        |> Floki.find("a." <> @bulma_item_class)
        |> Floki.raw_html()

      assert link =~ link_item
  end

  test "item can be a div with arbitrary content" do
    current_item = "current item"
    div_item = "div_item"

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <Dropdown.ContentItem>
            <dl>
              <dt>Arbitrary Term</dt>
              <dd>{div_item}</dd>
            </dl>
          </Dropdown.ContentItem>

        </Dropdown>
        """
      end

      div_content =
        html
        |> Floki.parse_document!()
        |> Floki.find("div." <> @bulma_item_class)
        |> Floki.find("dl")
        |> Floki.find("dd")
        |> Floki.raw_html()

      assert div_content =~ div_item
  end

  test "dropdown can contain dividers" do
    current_item = "current item"

    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id">
          <Dropdown.CurrentItem>{current_item}</Dropdown.CurrentItem>
          <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
          <Dropdown.Divider />
          <Dropdown.ContentItem>
            <p>Arbitrary Term</p>
          </Dropdown.ContentItem>
          <Dropdown.Divider />
          <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    dividers =
      html
      |> Floki.parse_document!()
      |> Floki.find("hr." <> @bulma_divider_class)

    assert length(dividers) == 2
  end
  test "dropdown can be made hoverable" do
    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id" is_hoverable>
          <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    assert html =~ @bulma_hoverable_class
  end

  test "dropdown can be made always active" do
    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id" is_active>
        <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    assert html =~ @bulma_active_class

  end
  test "dropdown can be right-aligned" do
    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id" is_right>
        <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    assert html =~ @bulma_right_class
  end
  test "dropdown can be drop-up" do
    html =
      render_surface do
        ~F"""
        <Dropdown id="test_id" is_up>
        <Dropdown.LinkItem to="#">Link</Dropdown.LinkItem>
        </Dropdown>
        """
      end

    assert html =~ @bulma_up_class
  end
end
