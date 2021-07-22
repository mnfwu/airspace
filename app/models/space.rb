class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :price, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  include PgSearch::Model
  pg_search_scope :search,
    against: %i[title category city address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # pg_search_scope :search_by_category,
  #   against: %i[category],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
