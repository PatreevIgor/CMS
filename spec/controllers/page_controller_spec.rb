require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    let(:published_page1)     { FactoryBot.create(:page) }
    let(:published_page2)     { FactoryBot.create(:page) }
    let(:not_published_page1) { FactoryBot.create(:page, published_at: Time.now + 1.day) }
    let(:not_published_page2) { FactoryBot.create(:page, published_at: Time.now + 1.day) }
    let(:pages)               { [published_page1, published_page2, not_published_page1, not_published_page2] }
    let(:published_pages)     { [published_page1, published_page2] }

    it 'populates an array of all pages' do
      get :index

      expect(assigns(:pages)).to match_array(pages)
    end

    it 'populates an array of published pages' do
      get :index

      expect(assigns(:published_pages)).to match_array(published_pages)
    end

    it 'renders index view' do
      get :index

      expect(response).to render_template :index
    end
  end
end
