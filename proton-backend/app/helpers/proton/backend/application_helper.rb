module Proton
  module Backend
    module ApplicationHelper
      def fa_icon_link(path, fa, content, **other)
        link_to path, other do
          concat content_tag(:i, nil, class: "fa fa-#{fa}")
          concat content_tag(:span, content)
        end
      end

      def fa_icon_menu_link(path, fa, content, **other)
        link_to path, other do
          concat content_tag(:i, nil, class: "fa fa-#{fa} pull-right")
          concat content_tag(:span, content)
        end
      end

      def bs_flash_text(flash_type)
        text_class = case flash_type
                       when :alert then 'danger'
                       when :notice then 'success'
                     end

        content_tag :span, flash[flash_type], class: "text-#{text_class}"
      end
    end
  end
end
