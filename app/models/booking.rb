class Booking < ApplicationRecord
  belongs_to :scooter
  belongs_to :user
  has_many :reviews

  validates :scooter_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
