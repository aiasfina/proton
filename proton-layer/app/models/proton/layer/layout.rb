module Proton::Layer
  class Layout < ApplicationRecord
    self.table_name = 'layer_layouts'

    validates :title, presence: true
    validates :identify, presence: true, uniqueness: true

    TAG_REGEXP = /{{\s*(css|js):(.*?)\s*}}/
    def scan_and_convert_tag
      content.gsub!(TAG_REGEXP) do |match|
        if /{{\s*js:(.*?)\s*}}/ =~ match
          javascript_include_tag(js_path($1))
        elsif /{{\s*css:(.*?)\s*}}/ =~ match
          stylesheet_link_tag(css_path($1))
        end
      end
    end

    delegate :js_path, :css_path, to: :'Proton::Layer::Engine.routes.url_helpers'
    delegate :javascript_include_tag, :stylesheet_link_tag, to: :'ActionController::Base.helpers'
  end
end
