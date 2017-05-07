module Proton::Layer
  class Layout < ApplicationRecord
    self.table_name = 'layer_layouts'

    has_many :pages, class_name: 'Proton::Layer::Page', dependent: :nullify

    validates :title, presence: true
    validates :identify, presence: true, uniqueness: true
  end
end
