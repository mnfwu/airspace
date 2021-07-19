class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :price, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
