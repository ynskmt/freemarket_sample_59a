class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_num, :expiration_month, :expiration_year, :security_code, presence: true
end
