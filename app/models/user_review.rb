class UserReview < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :content, presence: true, length: { minimum: 2, too_short: "Votre commentaire doit faire au moins 50 caractères" }
  
end
