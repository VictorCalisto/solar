require 'rails_helper'

RSpec.describe "funcionarios/show", type: :view do
  before(:each) do
    assign(:funcionario, Funcionario.create!(
      nome: "Nome",
      cargo: "Cargo",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cargo/)
    expect(rendered).to match(//)
  end
end
