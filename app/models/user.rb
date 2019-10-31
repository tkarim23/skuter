class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scooters
  has_many :bookings
  has_many :reviews

  mount_uploader :photo, PhotoUploader

  # validates :name, presence: true
  # validates :location, presence: true
  # validates :bank_account, presence: true, uniqueness: true
end
