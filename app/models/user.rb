# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  nb_of_messages         :integer          default(0), not null
#  nb_of_reviews          :integer          default(0), not null
#  pseudo_g1              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_action :configure_permitted_parameters, if: :devise_controller?

         
  has_many :flats, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :customer_bookings, class_name: "Booking"
  has_many :owner_bookings, through: :flats, source: :bookings, dependent: :destroy
  has_attachment :avatar, accept: [:jpg, :png, :jpeg]


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
  # Because we have a "paid" scope on payments, we can retrieve User's paid booking through a merge:User.joins(:bookings).merge(Payment.paid)
         
end
