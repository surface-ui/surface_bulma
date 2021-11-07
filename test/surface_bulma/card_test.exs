defmodule Surface.Components.CardTest do
  use SurfaceBulma.ConnCase, async: true
  alias SurfaceBulma.Card

  @bulma_container_class "card"
  @bulma_body_class "card-content"
  @bulma_header_class "card-header"
  @bulma_header_title_class "card-header"
  @bulma_header_title_class "card-header-title"
  @bulma_header_icon_class "card-header-icon"
  @bulma_image_class "card-image"
  @bulma_footer_class "card-footer"
  @bulma_footer_item_class "card-footer-item"

  test "creates a container with a nested content container" do
    arbitrary_content = "Ok"

    html =
      render_surface do
        ~F"""
        <Card>
          {arbitrary_content}
        </Card>
        """
      end

    outer_container =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)

    content_container =
      outer_container
      |> Floki.find("." <> @bulma_body_class)

    assert length(outer_container) == 1
    assert length(content_container) == 1
    assert Floki.raw_html(content_container) =~ arbitrary_content
  end

  test "body renders arbitrary content" do
    html =
      render_surface do
        ~F"""
        <Card>
          <section>
            <p>Arbitrary Markup</p>
          </section>
        </Card>
        """
      end

    card_body =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_body_class)

    assert Floki.raw_html(card_body) =~ "<section>"
    assert Floki.raw_html(card_body) =~ "Arbitrary Markup"
  end

  test "classes propagate to card container element" do
    test_class1 = "test_class1"
    test_class2 = "test_class2"

    html =
      render_surface do
        ~F"""
        <Card class={test_class1, test_class2}>
          Ok
        </Card>
        """
      end

    classes =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> extract_attribute("class")

    [@bulma_container_class, test_class1, test_class2]
    |> Enum.each(fn test_class -> assert test_class in classes end)
  end

  test "custom options propagate to card attrs" do
    custom_data_attr = "data-custom"
    custom_data_value = "custom_data_value"
    custom_opts = ["#{custom_data_attr}": custom_data_value]

    html =
      render_surface do
        ~F"""
        <Card attrs={custom_opts}>
          Ok
        </Card>
        """
      end

    custom_data_attribute =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> extract_attribute(custom_data_attr)

    assert custom_data_value in custom_data_attribute
  end

  test "header renders as child of card component" do
    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Header />
        </Card>
        """
      end

    header_component =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_header_class)

    assert length(header_component) == 1
  end

  test "header renders title" do
    arbitrary_title = "arbitrary title"

    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Header>
            <Card.Header.Title>{arbitrary_title}</Card.Header.Title>
          </Card.Header>
        </Card>
        """
      end

    header_title_html_tree =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_header_class)
      |> Floki.find("." <> @bulma_header_title_class)

    header_title_classes = extract_attribute(header_title_html_tree, "class")

    assert @bulma_header_title_class in header_title_classes
    assert Floki.raw_html(header_title_html_tree) =~ arbitrary_title
  end

  test "header renders icon" do
    arbitrary_icon = "arbitrary icon"

    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Header>
            <Card.Header.Icon>{arbitrary_icon}</Card.Header.Icon>
          </Card.Header>
        </Card>
        """
      end

    header_icon_html_tree =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_header_class)
      |> Floki.find("." <> @bulma_header_icon_class)

    header_icon_classes = extract_attribute(header_icon_html_tree, "class")

    assert @bulma_header_icon_class in header_icon_classes
    assert Floki.raw_html(header_icon_html_tree) =~ arbitrary_icon
  end

  test "renders image" do
    arbitrary_image_url = "https://via.placeholder.com/150"

    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Image>
            <img src={arbitrary_image_url} />
          </Card.Image>
        </Card>
        """
      end

    image_html_tree =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_image_class)


    image_classes = extract_attribute(image_html_tree, "class")

    assert @bulma_image_class in image_classes
    assert Floki.raw_html(image_html_tree) =~ arbitrary_image_url
  end

  test "renders footer" do
    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Footer>
            <Card.FooterItem />
          </Card.Footer>
        </Card>
        """
      end

    footer_html_tree =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_footer_class)


    footer_classes = extract_attribute(footer_html_tree, "class")

    assert @bulma_footer_class in footer_classes
  end
  test "renders footer items" do
    html =
      render_surface do
        ~F"""
        <Card>
          <Card.Footer>
            <Card.FooterItem />
            <Card.FooterItem />
            <Card.FooterItem />
          </Card.Footer>
        </Card>
        """
      end

    footer_items =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_footer_class)
      |> Floki.find("." <> @bulma_footer_item_class)

    assert length(footer_items) == 3
    assert Enum.each(footer_items, fn item ->
      classes = extract_attribute(item, "class")
      assert @bulma_footer_item_class in classes
    end)
  end



  defp extract_attribute(html_tree, attribute) do
    html_tree
    |> Floki.attribute(attribute)
    |> Enum.map(&String.split/1)
    |> List.flatten()
  end
end
