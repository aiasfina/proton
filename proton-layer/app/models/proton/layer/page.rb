module Proton::Layer
  class Page < ApplicationRecord
    self.table_name = 'layer_pages'

    belongs_to :layout, class_name: 'Proton::Layer::Layout'

    validates :title, presence: true
    validates :layout_id, presence: true
    validates :identify, presence: true, uniqueness: true

    before_save :merge_with_layout
    def merge_with_layout
      self.content_merged =
        layout
        .scan_and_convert_tag
        .gsub!(/{{\s*yield\s*}}/, content)
    end
  end
end
