class Payment < ApplicationRecord
  belongs_to :booking
  validates :amount, presence: true

end
