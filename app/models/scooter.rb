class Scooter < ApplicationRecord
  belongs_to :model
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :model_id, presence: true
  validates :user_id, presence: true
  validates :location, presence: true
  validates :age, presence: true
  validates :mileage, presence: true
  validates :condition, presence: true
  validates :photo, presence: true
  validates :price_per_day, presence: true
end
