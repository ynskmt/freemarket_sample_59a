# README

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique:true|
|password|string|null:false, unique:true|
|phone_num|integer|null:false, unique:true|
|authentication_code|integer|null:false|

### Association
- has_many :products
- has_one :credit_cards
- has_one :address
- has_one :user_profile
- has_many :buying_lisst
- has_many :selling_list
- has_many :review

## User_profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|nickname|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|introduction|text||
|image|string||

### Association
- belongs_to :user

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|block|string|null:false|
|building_name|string||
|phone_num|integer||

### Association
- belongs_to: user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|card_num|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to: user

## buying_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null:false|
|product_description|text|null:false|
|user_id|references|null:false, foreign_key:true|
|category|string|null: false|
|brand|string|null:false
|size|string|null:false|
|condition|string|null:false|
|delivery_charge|integer|null:false|
|delivery_way|string|null:false|
|delivery_area|string|null:false|
|delivery_day|integer|null:false|
|price|integer|null:false|
|buying_comment_id|references||
|product_image_id|references|null:false|
### Association
- belongs_to :user
- has_many :images
- has_many :buying_comment
- has_one :selling_list
- has_one :buying_list
- has_many :review

## Buying_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|comment|string|null:false|
|product_id|references|null:false, foreign_key:true|
### Association
- belongs_to :product
- belongs_to :user

## Product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null:false, foreign_key:true|
### Association
- belongs_to :product

## Selling_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|

### Association
- belongs_to :product
- belongs_to :user

## Reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key|
|product_id|references|null:false, foreign_key|
|rate|integer|null:false|

### Association
- belongs_to :product
- belongs_to :user