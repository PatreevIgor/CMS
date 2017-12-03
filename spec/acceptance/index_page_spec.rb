require 'rails_helper'
# save_and_open_page

feature 'Create page', %q{
  I want to show only published pages, when push to button Hide unpublished Pages
  I want to show only unpublished pages, when push to button View unpublished Pages
} do

  scenario 'Show published pages' do
    visit pages_path
  end

  scenario 'Show unpublished pages' do
    visit pages_path
  end
end
