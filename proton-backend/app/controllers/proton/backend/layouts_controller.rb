require_dependency "proton/backend/application_controller"

module Proton::Backend
  class LayoutsController < ApplicationController
    def index
      @layouts = Proton::Layer::Layout.page params[:page]
    end

    def new
      @layout = Proton::Layer::Layout.new
    end

    def create
      @layout = Proton::Layer::Layout.new
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
