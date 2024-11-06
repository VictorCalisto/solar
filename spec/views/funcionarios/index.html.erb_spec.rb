require 'rails_helper'

RSpec.describe "funcionarios/index", type: :view do
  before(:each) do
    assign(:funcionarios, [
      Funcionario.create!(
        nome: "Nome",
        cargo: "Cargo",
        user: nil
      ),
      Funcionario.create!(
        nome: "Nome",
        cargo: "Cargo",
        user: nil
      )
    ])
  end

  it "renders a list of funcionarios" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cargo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
