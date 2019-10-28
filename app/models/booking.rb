class Booking < ApplicationRecord
  belongs_to :scooter
  belongs_to :user
end
