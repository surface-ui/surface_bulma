defmodule Surface.Components.ModalTest do
  use SurfaceBulma.ConnCase, async: true

  alias SurfaceBulma.Button
  alias SurfaceBulma.Modal.{Card, Header, Footer}
  alias SurfaceBulma.Modal

  test "renders regular modal with simple text in it" do
    html =
      render_surface do
        ~H"""
        <Modal show={{true}}>hello</Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert Floki.find(parsed, "div.modal > div.modal-content")
           |> Floki.text() =~ "hello"
  end

  test "show prop properly shows and hides modal" do
    html =
      render_surface do
        ~H"""
        <Modal show={{true}}>hello</Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [{"div", [{"class", "modal is-active"}], _} | _] = Floki.find(parsed, "div")

    html2 =
      render_surface do
        ~H"""
        <Modal show={{false}}>hello</Modal>
        """
      end

    parsed2 = Floki.parse_fragment!(html2)
    assert [{"div", [{"class", "modal"}], _} | _] = Floki.find(parsed2, "div")
  end

  test "regular modal can contain anything" do
    html =
      render_surface do
        ~H"""
        <Modal show={{true}}><Button>ok</Button></Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [{"button", _, _}] = Floki.find(parsed, "div.modal-content > button")
  end

  test "modal should optionally show close button" do
    html =
      render_surface do
        ~H"""
        <Modal show={{true}} show_close_button={{true}}>hello</Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [{"button", _, _}] = Floki.find(parsed, "div.modal > button")

    html =
      render_surface do
        ~H"""
        <Modal show={{true}} show_close_button={{false}}>hello</Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [] = Floki.find(parsed, "div.modal > button")
  end

  test "card modal should display content in header, footer and default slot" do
    html =
      render_surface do
        ~H"""
        <Card show={{true}} show_close_button={{true}}>
        <Header>
        headertext
        </Header>
        hello
        <Footer>
        footertext
        </Footer>
        </Card>
        """
      end

    assert html =~ """
           <div class="modal is-active">
             <div class="modal-background"></div>
             <div class="modal-card">
               <header class="modal-card-head">
                 <p class="modal-card-title">
           headertext
           </p>
                 <button phx-click="modal_close" aria-label="close" class="delete">
           </button>
               </header>
               <section class="modal-card-body">
           hello
               </section>
               <footer class="modal-card-foot" style="justify-content: flex-end">
           footertext
               </footer>
             </div>
           </div>
           """
  end

  test "card modal should display should respect show prop" do
    html =
      render_surface do
        ~H"""
        <Card show={{false}} show_close_button={{true}}>
        <Header>
        headertext
        </Header>
        hello
        <Footer>
        footertext
        </Footer>
        </Card>
        """
      end

    assert html =~ """
           <div class="modal">
             <div class="modal-background"></div>
             <div class="modal-card">
               <header class="modal-card-head">
                 <p class="modal-card-title">
           headertext
           </p>
                 <button phx-click="modal_close" aria-label="close" class="delete">
           </button>
               </header>
               <section class="modal-card-body">
           hello
               </section>
               <footer class="modal-card-foot" style="justify-content: flex-end">
           footertext
               </footer>
             </div>
           </div>
           """
  end

  test "card modal should be usable without header and footer should still show close button" do
    html =
      render_surface do
        ~H"""
        <Card show={{false}} show_close_button={{true}}>
        hello
        </Card>
        """
      end

    assert html =~ """
           <div class="modal">
             <div class="modal-background"></div>
             <div class="modal-card">
               <header class="modal-card-head">
                 <button phx-click="modal_close" aria-label="close" class="delete">
           </button>
               </header>
               <section class="modal-card-body">
           hello
               </section>
             </div>
           </div>
           """
  end

  test "card modal should be usable without header and footer. If no close button don't show header" do
    html =
      render_surface do
        ~H"""
        <Card show={{false}} show_close_button={{false}}>
        hello
        </Card>
        """
      end

    assert html =~ """
           <div class="modal">
             <div class="modal-background"></div>
             <div class="modal-card">
               <section class="modal-card-body">
           hello
               </section>
             </div>
           </div>
           """
  end
end
