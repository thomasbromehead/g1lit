class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :flat_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200, too_long: "Merci de choisir un titre concis de moins de 200 caractères, ex: Adorable petite chaumière normande au bord de l'eau" }
  validates :description, presence: true
  validates :category, presence: true

  has_many_attached :files

  scope :available, -> {where(booked:false)}
  scope :booked, -> {where(booked:true)}

end
  