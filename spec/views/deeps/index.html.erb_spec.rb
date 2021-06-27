require 'rails_helper'

RSpec.describe "deeps/index", type: :view do
  before(:each) do
    assign(:deeps, [
      Deep.create!(
        deep: "MyText"
      ),
      Deep.create!(
        deep: "MyText"
      )
    ])
  end

  it "renders a list of deeps" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
