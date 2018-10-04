# == Schema Information
#
# Table name: user_reviews
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class UserReview < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :content, presence: true, length: { minimum: 2, too_short: "Votre commentaire doit faire au moins 50 caractères" }
  
end
