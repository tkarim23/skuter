class Scooter < ApplicationRecord
  belongs_to :model
  belongs_to :user
end
