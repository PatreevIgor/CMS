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

  describe 'GET #show' do
    let(:page) { FactoryBot.create(:page) }
    before { get :show, params: { id: page.id } }

    it 'assigns the requested Page to @page' do
      expect(assigns(:page)).to eq page
    end

    it 'render show view' do
       expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Page to @page' do
      expect(assigns(:page)).to be_a_new(Page)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:page) { FactoryBot.create(:page) }
    before { get :edit, params: { id: page.id } }

    it 'assigns the requested Page to @page' do
      expect(assigns(:page)).to eq page
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end
end
