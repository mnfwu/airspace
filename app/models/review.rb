class Review < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :content, presence: true, length: { minimum: 5 }
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
end
