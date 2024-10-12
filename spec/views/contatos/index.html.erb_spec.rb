require 'rails_helper'

RSpec.describe "contatos/index", type: :view do
  before(:each) do
    assign(:contatos, [
      Contato.create!(
        nome: "Nome",
        email: "Email",
        telefone: 2,
        whatsapp: 3
      ),
      Contato.create!(
        nome: "Nome",
        email: "Email",
        telefone: 2,
        whatsapp: 3
      )
    ])
  end

  it "renders a list of contatos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
