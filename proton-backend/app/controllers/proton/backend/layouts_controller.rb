require_dependency "proton/backend/application_controller"

module Proton::Backend
  class LayoutsController < ApplicationController
    before_action :set_layout, except: [:index, :new, :create]

    def index
      @layouts = Proton::Layer::Layout.page params[:page]
    end

    def new
      @layout = Proton::Layer::Layout.new
    end

    def create
      @layout = Proton::Layer::Layout.new params.require(:layout).permit!
      @layout.save
    end

    def edit
    end

    def update
      @layout.update params.require(:layout).permit!
    end

    def destroy
    end

    private
    def set_layout
      @layout = Proton::Layer::Layout.find params[:id]
    end
  end
end
