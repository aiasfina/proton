module Proton
  module Backend
    module ApplicationHelper
      def fa_icon_link(path, fa, content, **other)
        link_to path, other do
          concat content_tag(:i, nil, class: "fa fa-#{fa}")
          concat content_tag(:span, content)
        end
      end
    end
  end
end
