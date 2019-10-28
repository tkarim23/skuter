class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :reviews
  belongs_to :booking
  belongs_to :scooter

  validates :name, presence: true
  validates :location, presence: true
  validates :bank_account, presence: true, uniqueness: true
end
