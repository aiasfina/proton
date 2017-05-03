module Proton::Core
  class Post < ApplicationRecord

    belongs_to :user, class_name: 'Proton::Core::User'

    validates :title, presence: true

    def published?
      !!published_at
    end

    def publish
      update published_at: Time.zone.now
    end

    def unpublish
      update published_at: nil
    end
  end
end
