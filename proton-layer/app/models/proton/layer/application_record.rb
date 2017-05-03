module Proton
  module Layer
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
