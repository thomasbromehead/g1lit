class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "user_id"  
  belongs_to :flat, counter_cache: true
  has_one :payment

  validates :nb_of_nights, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0, }

end
