require 'rails_helper'

RSpec.describe "funcionarios/edit", type: :view do
  let(:funcionario) {
    Funcionario.create!(
      nome: "MyString",
      cargo: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:funcionario, funcionario)
  end

  it "renders the edit funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionario_path(funcionario), "post" do
      assert_select "input[name=?]", "funcionario[nome]"

      assert_select "input[name=?]", "funcionario[cargo]"

      assert_select "input[name=?]", "funcionario[user_id]"
    end
  end
end
