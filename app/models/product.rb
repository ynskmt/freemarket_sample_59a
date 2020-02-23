class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :delivery_way

  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :user_id, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_way_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true
end
