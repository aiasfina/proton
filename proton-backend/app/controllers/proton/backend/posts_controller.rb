require_dependency "proton/backend/application_controller"

module Proton::Backend
  class PostsController < ApplicationController
    before_action :set_post, except: [:index, :new, :create]
    layout false, only: [:new, :edit]

    def index
      @posts = Proton::Core::Post.page params[:page]
    end

    def new
      @post = Proton::Core::Post.new
    end

    def create
      @post = current_user.posts.build params.require(:post).permit!

      if @post.save
        render json: {id: @post.id}.to_json
      else
        head :internal_server_error
      end
    end

    def edit
      render :new
    end

    def update
      @post.update params.require(:post).permit!
      head :ok
    end

    private
    def set_post
      @post = Proton::Core::Post.find params[:id]
    end
  end
end
