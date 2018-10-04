# == Schema Information
#
# Table name: payments
#
#  id         :bigint(8)        not null, primary key
#  amount     :float
#  confirmed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :booking
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0}


  scope :paid, -> {where("payment.confimed = ?", true)}

  def new
  end

  def create
  end

  def payment_params

  end

end
