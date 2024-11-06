require 'rails_helper'

RSpec.describe "funcionarios/new", type: :view do
  before(:each) do
    assign(:funcionario, Funcionario.new(
      nome: "MyString",
      cargo: "MyString",
      user: nil
    ))
  end

  it "renders new funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionarios_path, "post" do
      assert_select "input[name=?]", "funcionario[nome]"

      assert_select "input[name=?]", "funcionario[cargo]"

      assert_select "input[name=?]", "funcionario[user_id]"
    end
  end
end
