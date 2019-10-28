class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :user_id, presence: true
  validates :booking_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
