require 'rails_helper'

RSpec.describe 'deeps/index', type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)

    sign_in @user
    assign(:deeps, [
             Deep.create!(
               text: 'MyText',
               user: @user
             )

           ])
  end

  it 'renders a list of deeps' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 1
  end
end
