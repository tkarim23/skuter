class Model < ApplicationRecord
  has_many :scooters
  has_many :bookings, through: :scooters
  has_many :users, through: :scooters
  has_many :reviews, through: :bookings

  validates :brand, presence: true,
  validates :name, presence: true, uniqueness: true
  validates :cc, presence: true
  validates :fuel, presence: true
  validates :size, presence: true
end
