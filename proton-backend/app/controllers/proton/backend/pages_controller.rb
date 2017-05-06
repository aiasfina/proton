require_dependency "proton/backend/application_controller"

module Proton::Backend
  class PagesController < ApplicationController
    before_action :set_page, except: [:index, :new, :create]

    def index
      @pages = Proton::Layer::Page.page params[:page]
    end

    def show
    end

    def new
      @page = Proton::Layer::Page.new
    end

    def create
      @page = Proton::Layer::Page.new params.require(:page).permit!
      @page.save
      render_update_js(@page)
    end

    def edit
      render :new
    end

    def update
      @page.update params.require(:page).permit!
      render_update_js(@page)
    end

    private
    def set_page
      @page = Proton::Layer::Page.find params[:id]
    end
  end
end
