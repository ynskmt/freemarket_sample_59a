# 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|phone_num|string|null:false|
|email|string|null: false|
|password|string|null:false|
### Association
- has_many :products
- has_one :card
- has_one :address
- has_many :sns_credentials

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_name|string|null:false|
|product_description|text|null:false|
|category_id|string|null:false|
|condition_id|string|null:false|
|delivery_charge_id|integer|null:false|
|delivery_way_id|string|null:false|
|delivery_area_id|string|null:false|
|delivery_day_id|integer|null:false|
|price|integer|null:false|
|selling_status_id|string|null:false|
### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- accepts_nested_attributes_for :images, allow_destroy: true
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days
- belongs_to_active_hash :delivery_way

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product|references|null:false, foreign_key:true|
### Association
- belongs_to :product, optional: true

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|zip_code|integer|null:false|
|prefecture_id|string|null:false|
|city|string|null:false|
|block_num|string|null:false|
|building_name|string|
|phone_num|integer|
|user_id|references|null:false, foeighn_key:true|
### Association
- belongs_to: user
- belongs_to_active_hash :prefecture

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to: user, optional: true

## Categoriesテーブル   
|Column|Tyep|Option|
|------|----|-------|
|name|string|null:false|
|ancestry|string|index:true|
### Association
- has_many :products
- has_ancestry

## SnsCredentialsテーブル   
|Column|Tyep|Option|
|------|----|-------|
|user_id|references|foreign_key:true|
|provider|string|
|uid|string|
### Association
- has_many :user, optional: true