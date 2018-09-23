class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats, dependent: :destroy
  has_many :user_reviews, dependent: :destroy

  has_many :customer_bookings, class_name: "Booking"
  has_many :owner_bookings, through: :flats, source: :bookings, dependent: :destroy
         
end
