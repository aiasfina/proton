module Proton::Core
  class User < ApplicationRecord
    self.table_name = 'core_users'

    authenticates_with_sorcery!
  end
end
