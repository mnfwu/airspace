class User < ApplicationRecord
  has_many :spaces
  has_many :bookings
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
