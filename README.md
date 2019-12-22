# README

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique:true|
|password|string|null:false|
|phone_num|integer|null:false, unique:true|
|authentication_code|integer|null:false|

### Association
- has_many :products, :dependent => :destroy
- has_one :credit_cards, :dependent => :destroy
- has_one :address, :dependent => :destroy
- has_one :user_profile, :dependent => :destroy
- has_many :buying_lists, :dependent => :destroy
- has_many :selling_lists, :dependent => :destroy
- has_many :reviews, :dependent => :destroy

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

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|card_num|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to: user

## Buying_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

## Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

## Categoriesテーブル   
|Column|Tyep|Option|
|------|----|-------|
|name|string|null:false, unique:true|

### Association
- has_many :products

## Brandsテーブル
|Column|Tyep|Option|
|------|----|-------|
|name|string|null:false|

### Association
- has_many :products

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|description|text|null:false|
|user_id|references|null:false, foreign_key:true|
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
- has_many :images, :dependent => :destroy
- has_many :buying_comments, :dependent => :destroy
- has_one :selling_list, :dependent => :destroy
- has_one :buying_list, :dependent => :destroy
- has_many :reviews, :dependent => :destroy

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