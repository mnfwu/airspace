class Review < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :content, presence: true, length: { minimum: 5 }
end
