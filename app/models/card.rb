class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_num, :expiration_month, :expiration_year, :customer_id, :card_id, presence: true
end
