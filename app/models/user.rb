class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :firstname, :lastname, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day, :phone_num ,presence: true, on: :sms_authentication_create
end
