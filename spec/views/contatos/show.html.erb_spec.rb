require 'rails_helper'

RSpec.describe "contatos/show", type: :view do
  before(:each) do
    assign(:contato, Contato.create!(
      nome: "Nome",
      email: "Email",
      telefone: 2,
      whatsapp: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
