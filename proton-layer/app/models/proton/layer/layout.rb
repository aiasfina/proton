module Proton::Layer
  class Layout < ApplicationRecord
    self.table_name = 'layer_layouts'

    validates :title, presence: true
    validates :identify, presence: true, uniqueness: true
  end
end
