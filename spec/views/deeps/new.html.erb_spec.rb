require 'rails_helper'

RSpec.describe "deeps/new", type: :view do
  before(:each) do
    assign(:deep, Deep.new(
      deep: "MyText"
    ))
  end

  it "renders new deep form" do
    render

    assert_select "form[action=?][method=?]", deeps_path, "post" do

      assert_select "textarea[name=?]", "deep[deep]"
    end
  end
end
