require_dependency "proton/backend/application_controller"

module Proton::Backend
  class PostsController < ApplicationController
    before_action :set_post, except: [:index, :new, :create]

    def index
      @posts = Proton::Core::Post.page params[:page]
    end

    def new
      @post = Proton::Core::Post.new
    end

    def create
      @post = Proton::Core::Post.build params.require(:post).permit!
      @post.save
      render_update_js(@post)
    end

    def edit
      render :new
    end

    def update
      @post.update params.require(:post).permit!
      render_update_js(@post)
    end

    private
    def set_post
      @post = Proton::Core::Post.find params[:id]
    end
  end
end
