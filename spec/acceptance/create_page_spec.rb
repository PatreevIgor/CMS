require 'rails_helper'
# save_and_open_page

feature 'Create page', %q{
  I want to be able to create page
} do
  
  scenario 'Authentificated user creates page' do
    User.create!(email: 'user@test.com', password: '12345678')

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    visit pages_path
    click_on 'New Page'
    fill_in 'Title',       with: 'MyTitle'
    fill_in 'Description', with: 'MyDescription'
    fill_in 'Slug',        with: 'MySlug'
    fill_in 'Menu label',  with: 'MyMenu_label'
    fill_in 'H1',          with: 'MyH1'
    fill_in 'Content',     with: 'MyContent'
    fill_in 'Priority',    with: 1
    click_on 'Save'

    expect(page).to have_content 'Page was successfully created.'
  end

  scenario 'Non-authentificated user creates page' do
    visit pages_path
    click_on 'New Page'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end



end
