class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "user_id"  
  belongs_to :flat, counter_cache: true
  has_one :payment


end
