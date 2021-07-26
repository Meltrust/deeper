require 'capybara/rspec'

RSpec.describe 'Signing up' do
  it 'signs up the user' do
    visit '/users/sign_up'
    sleep(1)

    within('#new_user') do
      fill_in 'Fullname', with: 'Tapstaps Tapsy'
      fill_in 'Username', with: 'Testyuser'
      fill_in 'Email', with: 'testy1@outlook.com'
      fill_in 'Password', with: 'tapstapstapsy'
      fill_in 'Password confirmation', with: 'tapstapstapsy'
    end

    sleep(1)
    click_button 'Sign up'

    sleep(2)
    expect(page).to have_content 'Welcome!'
  end
end
