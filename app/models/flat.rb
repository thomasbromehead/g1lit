# == Schema Information
#
# Table name: flats
#
#  id              :bigint(8)        not null, primary key
#  animals         :boolean
#  booked          :boolean          default(FALSE), not null
#  category        :string
#  description     :text
#  image_data      :text
#  nb_of_bathrooms :integer
#  nb_of_bookings  :integer          default(0), not null
#  nb_of_reviews   :integer          default(0), not null
#  nb_rooms        :integer
#  price_per_night :integer
#  smoking         :boolean
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#
# Indexes
#
#  index_flats_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :flat_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200, too_long: "Merci de choisir un titre concis de moins de 200 caractères, ex: Adorable petite chaumière normande au bord de l'eau" }
  validates :description, presence: true
  validates :category, presence: true

  has_many_attached :photos
  has_one_attached :photo

  scope :available, -> {where(booked:false)}
  scope :booked, -> {where(booked:true)}

end
  
