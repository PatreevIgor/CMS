require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:page) { FactoryBot.create(:page) }
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
    before { get :edit, params: { id: page.id } }

    it 'assigns the requested Page to @page' do
      expect(assigns(:page)).to eq page
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saved the new page in the database' do
        expect { post :create, params: { page: FactoryBot.attributes_for(:page) } }.to change(Page, :count).by(1)
        # or 
        # old_count = Page.count
        # post :create, params: { page: FactoryBot.attributes_for(:page) }
        # expect(Page.count).to eq old_count + 1
      end

      it 'redirect to show view' do
        post :create, params: { page: FactoryBot.attributes_for(:page) }

        expect(response).to redirect_to page_path(assigns(:page))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the page' do
        expect { post :create, params: { page: FactoryBot.attributes_for(:invalid_page) } }.to_not change(Page, :count)
      end

      it 're-renders new view' do
        post :create, params: { page: FactoryBot.attributes_for(:invalid_page) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assigns the requested page to @page' do
        patch :update, params: { id: page, page: FactoryBot.attributes_for(:page) }

        expect(assigns(:page)).to eq page
      end

      it 'changes page attributes' do
        patch :update, params: { id: page, page: { title: 'new title', description: 'new description' } }
        page.reload

        expect(page.title).to eq 'new title'
        expect(page.description).to eq 'new description'
      end

      it 'redirects to the updated page' do
        patch :update, params: { id: page, page: FactoryBot.attributes_for(:page) }

        expect(response).to redirect_to page
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { id: page, page: {title: 'new title', description: nil} } }

      it 'does not change page attributes' do
        page.reload

        expect(page.title).to eq 'MyString'
        expect(page.description).to eq 'MyText'
      end

      it 're-renders edit view' do 
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { page }

    it 'deletes page' do
      expect { delete :destroy, params: { id: page } }.to change(Page, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: page }

      expect(response).to redirect_to pages_path
    end
  end
end
