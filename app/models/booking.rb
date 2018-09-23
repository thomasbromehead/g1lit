class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "user_id"  
  belongs_to :flat
  has_one :payment


end
