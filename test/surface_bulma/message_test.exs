defmodule Surface.Components.MessageTest do
  use SurfaceBulma.ConnCase, async: true
  alias SurfaceBulma.Message

  @bulma_container_class "message"
  @bulma_body_class "message-body"
  @bulma_header_class "message-header"
  @bulma_close_button_class "delete"

  test "renders container without header" do
    arbitrary_content = "arbitrary content"

    html =
      render_surface do
        ~F"""
        <Message id="test_id">
          {arbitrary_content}
        </Message>
        """
      end

    message_body =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_body_class)
      |> Floki.raw_html()

    assert message_body =~ @bulma_body_class
    refute html =~ @bulma_header_class
  end

  test "renders container with header" do
    arbitrary_content = "arbitrary content"
    header_content = "header_content"

    html =
      render_surface do
        ~F"""
        <Message id="test_id">
          <Message.Header>{header_content}</Message.Header>
          {arbitrary_content}
        </Message>
        """
      end

    message_header =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_header_class)
      |> Floki.raw_html()

    assert html =~ @bulma_header_class
    assert message_header =~ header_content
  end

  test "renders close button only when closable prop true" do
    arbitrary_content = "arbitrary content"
    header_content = "header_content"

    non_closable_html =
      render_surface do
        ~F"""
        <Message id="test_id">
          <Message.Header>{header_content}</Message.Header>
          {arbitrary_content}
        </Message>
        """
      end
    closable_html =
      render_surface do
        ~F"""
        <Message id="test_id" closable>
          <Message.Header>{header_content}</Message.Header>
          {arbitrary_content}
        </Message>
        """
      end

    refute non_closable_html =~ @bulma_close_button_class
    assert closable_html =~ @bulma_close_button_class
  end

  test "renders arbitrary content in body" do
    html =
      render_surface do
        ~F"""
        <Message id="test_id">
          <ul>
            <li>List item 1</li>
            <li>List item 2</li>
            <li>List item 3</li>
          </ul>
        </Message>
        """
      end

    message_body_contents =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_container_class)
      |> Floki.find("." <> @bulma_body_class)
      |> Floki.find("li")

    assert length(message_body_contents) == 3
  end

  test "applies color classes from color prop" do
    Enum.each(~w/dark primary link info success warning danger/, fn color ->
      html =
        render_surface do
          ~F"""
          <Message id="test_id" color={color}>
            content
          </Message>
          """
        end

      container_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_container_class)
        |> extract_attribute("class")

      assert "is-#{color}" in container_classes
    end)
  end

  test "applies size classes from size prop" do
    Enum.each(~w/small medium large/, fn size ->
      html =
        render_surface do
          ~F"""
          <Message id="test_id" size={size}>
            content
          </Message>
          """
        end

      container_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_container_class)
        |> extract_attribute("class")

      assert "is-#{size}" in container_classes
    end)
  end

  test "applies additional classes to container" do
    test_class="test_class"

      html =
        render_surface do
          ~F"""
          <Message id="test_id" container_class={test_class}>
            <Message.Header>header</Message.Header>
            content
          </Message>
          """
        end

      container_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_container_class)
        |> extract_attribute("class")

      assert test_class in container_classes

  end
  test "applies additional classes to header" do
    test_class="test_class"

      html =
        render_surface do
          ~F"""
          <Message id="test_id" header_class={test_class}>
            <Message.Header>header</Message.Header>
            content
          </Message>
          """
        end

      header_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_header_class)
        |> extract_attribute("class")

      assert test_class in header_classes

  end
  test "applies additional classes to close_button" do
    test_class="test_class"

      html =
        render_surface do
          ~F"""
          <Message id="test_id" closable close_class={test_class}>
            <Message.Header>header</Message.Header>
            content
          </Message>
          """
        end

      close_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_close_button_class)
        |> extract_attribute("class")

      assert test_class in close_classes

  end
  test "applies additional classes to body" do
    test_class="test_class"

      html =
        render_surface do
          ~F"""
          <Message id="test_id" body_class={test_class}>
            <Message.Header>header</Message.Header>
            content
          </Message>
          """
        end

      body_classes =
        html
        |> Floki.parse_document!()
        |> Floki.find("." <> @bulma_body_class)
        |> extract_attribute("class")

      assert test_class in body_classes

  end

  test "aria close label can be set from parent component" do
    test_aria = "override"

    html =
      render_surface do
        ~F"""
        <Message id="test_id" closable aria_close_label={test_aria}>
          <Message.Header>
            header
          </Message.Header>
          content
        </Message>
        """
      end

    [aria_label] =
      html
      |> Floki.parse_document!()
      |> Floki.find("." <> @bulma_close_button_class)
      |> extract_attribute("aria-label")

    assert test_aria == aria_label
  end

  test "clicking close button will close message", %{conn: conn} do
    {:ok, view, pre_click_html} = live_isolated(conn, __MODULE__.MessageCloseTest)

    post_click_html =
      view
      |> element("." <> @bulma_close_button_class)
      |> render_click()

    assert pre_click_html =~ @bulma_container_class
    refute post_click_html =~ @bulma_container_class
  end

  defp extract_attribute(html_tree, attribute) do
    html_tree
    |> Floki.attribute(attribute)
    |> Enum.map(&String.split/1)
    |> List.flatten()
  end

  defmodule MessageCloseTest do
    use Surface.LiveView
    alias SurfaceBulma.Message

    @impl true
    def render(assigns) do
      ~F"""
      <Message id="test_id" closable>
        <Message.Header>header</Message.Header>
        <p>content</p>
      </Message>
      """
    end
  end
end
