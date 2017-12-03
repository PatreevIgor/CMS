require 'rails_helper'
# save_and_open_page

feature 'User sing in', %q{
  User want to be able to sing in
} do

  given(:user) { FactoryBot.create(:user) }

  scenario 'Registered user try to sing in' do
    sign_in(user)
    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sing in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
