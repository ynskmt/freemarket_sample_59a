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
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
