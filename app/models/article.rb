class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
      ["body", "created_at", "id", "title", "updated_at"]
    end
  end
  