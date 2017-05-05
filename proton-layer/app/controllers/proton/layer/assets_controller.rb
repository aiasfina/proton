require_dependency "proton/layer/application_controller"

module Proton::Layer
  class AssetsController < ApplicationController
    before_action :set_layout, :use_null_session
    after_action  :set_cache_control_header

    def render_css
      render body: @layout.css, content_type: 'text/css'
    end

    def render_js
      render body: @layout.js, content_type: 'application/javascript'
    end

    private
    def set_layout
      @layout = Proton::Layer::Layout.find_by identify: params[:identify]
      return render body: nil, status: :not_found unless @layout
    end

    def use_null_session
      ActionController::RequestForgeryProtection::ProtectionMethods::NullSession.new(self)
        .handle_unverified_request
    end

    def set_cache_control_header
      if params[:cache_buster].present?
        response.headers['Cache-Control'] = "public, max-age=#{1.year.to_i}"
      end
    end
  end
end
