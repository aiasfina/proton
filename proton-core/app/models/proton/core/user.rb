module Proton::Core
  class User < ApplicationRecord
    self.table_name = 'core_users'

    authenticates_with_sorcery!

    has_many :posts, class_name: 'Proton::Core::Post'

    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, length: {minimum: 6}
  end
end
