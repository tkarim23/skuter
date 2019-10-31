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
  validates :price_per_day, presence: true
  validates :title, presence:true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
