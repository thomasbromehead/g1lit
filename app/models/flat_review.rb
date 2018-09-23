class FlatReview < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :content, presence: :true, length: { minimum: 2, too_short: "Votre commentaire doit faire au moins 80 caractères" }
end
