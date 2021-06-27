require 'rails_helper'

RSpec.describe "deeps/edit", type: :view do
  before(:each) do
    @deep = assign(:deep, Deep.create!(
      deep: "MyText"
    ))
  end

  it "renders the edit deep form" do
    render

    assert_select "form[action=?][method=?]", deep_path(@deep), "post" do

      assert_select "textarea[name=?]", "deep[deep]"
    end
  end
end
