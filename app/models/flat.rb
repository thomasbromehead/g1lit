class Flat < ApplicationRecord
  belongs_to :user
  has_many :flat_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200, too_long: "Merci de choisir un titre concis de moins de 200 caractères, ex: Adorable petite chaumière normande au bord de l'eau" }
  validates :description, presence: true
  validates :category, presence: true
  validates :nb_of_bathrooms, numericality: { only_integer: true, greater_than_or_equal_to: 1}, presence: true

  scope :available, -> {where(booked:false)}
  scope :booked, -> {where(booked:true)}

end
  