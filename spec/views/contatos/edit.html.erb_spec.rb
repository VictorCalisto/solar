require 'rails_helper'

RSpec.describe "contatos/edit", type: :view do
  let(:contato) {
    Contato.create!(
      nome: "MyString",
      email: "MyString",
      telefone: 1,
      whatsapp: 1
    )
  }

  before(:each) do
    assign(:contato, contato)
  end

  it "renders the edit contato form" do
    render

    assert_select "form[action=?][method=?]", contato_path(contato), "post" do

      assert_select "input[name=?]", "contato[nome]"

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[telefone]"

      assert_select "input[name=?]", "contato[whatsapp]"
    end
  end
end
