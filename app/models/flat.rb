class Flat < ApplicationRecord
  belongs_to :user
  has_many :flat_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy


end
