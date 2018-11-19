# == Schema Information
#
# Table name: flat_reviews
#
#  id          :bigint(8)        not null, primary key
#  content     :text
#  star_rating :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flat_id     :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_flat_reviews_on_flat_id  (flat_id)
#  index_flat_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#

class FlatReview < ApplicationRecord
  belongs_to :flat, counter_cache: :nb_of_reviews
  # belongs_to :customer, class_name: "User", foreign_key: "user_id"

  validates :content, presence: :true, length: { minimum: 2, too_short: "Votre commentaire doit faire au moins 50 caractères" }

  

end
