require 'rails_helper'
# save_and_open_page

feature 'Create page', %q{
  I want to show only published pages, when push to button Hide unpublished Pages
  I want to show only unpublished pages, when push to button View unpublished Pages
} do

  scenario 'Show published pages' do
    # visit pages_path

    # expect(page).to have_selector(:link_or_button, 'Hide unpublished Pages')
    # expect(page).to have_css('body#all_pages')
  end

  scenario 'Show unpublished pages' do
    # visit pages_path
    # click_on 'Hide unpublished Pages'

    # expect(page).to have_selector(:link_or_button, 'View unpublished Pages')
    # expect(page).to have_css('body#only_published')
  end
end
