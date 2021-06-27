require 'rails_helper'

RSpec.describe "deeps/show", type: :view do
  before(:each) do
    @deep = assign(:deep, Deep.create!(
      deep: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
