module Proton::Layer
  class Page < ApplicationRecord
    self.table_name = 'layer_pages'

    belongs_to :layout, class_name: 'Proton::Layer::Layout'

    validates :title, presence: true
    validates :identify, presence: true, uniqueness: true

    def merge_with_layout
    end
  end
end
