class PagesController < ApplicationController
  before_action :set_page,        only: [:show, :edit, :update, :destroy]
  before_action :set_title,       only: [:show, :edit, :update, :destroy]
  before_action :set_description, only: [:show, :edit, :update, :destroy]
  before_action :set_h1,          only: [:show, :edit, :update, :destroy]
  # GET /pages
  # GET /pages.json
  def index
    @pages       = Page.all
    @title       = 'Title for all pages'
    @description = 'Description for all pages'
    @h1          = 'H1 for all pages'
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    def set_title
      @title = Page.friendly.find(params[:id]).title
    end

    def set_description
      @description = Page.friendly.find(params[:id]).description
    end

    def set_h1
      @h1 = Page.friendly.find(params[:id]).h1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :description, :slug, :menu_label, :h1, :content, :published_at, :priority)
    end
end
