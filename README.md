# mercari DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, add_index, name: "index_users_on_email", unique: true, using: :btree|
|last_name|string|null: false, unique: true|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthdate_year|integer||
|birthdate_month|integer||
|birthdate_day|integer||
|phone_number|string|null: false|
|address_last_name|string||
|address_first_name|string||
|address_last_name_kana|string||
|address_first_name_kana|string||
|address_number|string|null: false|
|address_prefecture|string|null: false|
|address_name|string|null: false|
|address_block|string|null: false|
|address_building|string||
|address_phone_number|string||
|introduce|text|limit: 65535|
|encrypted_password|string|default: ""|
|reset_password_token|string|null: false, add_index, name: "index_users_on_reset_password_token", unique: true, using: :btree|
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|card_number|integer|null: false|
|expiry_date_month|integer|null: false|
|expiry_date_year|integer|null: false|
|security_code|integer|null: false|
### Association
- has_many :coments
- has_many :items


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comennt|text||
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|explanation|text|null: false|
|details_category_major|string|null: false|
|details_category_medium|string|null: false|
|details_category_minor|string|null: false|
|details_size|string|null: false|
|details_state|string|null: false|
|delivery_fee|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
### Association
<!-- - has_many :items_categorys
- has_many :categorys, through: :items_categorys -->
- has_many :coments
- belongs_to :user

<!-- ## items_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category -->


<!-- ## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|major_item|string||
|medium_item|string||
|minor_items|string||
### Association
- has_many :items_categorys
- has_many :items, through: :items_categorys -->

## items_brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :brand

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items_brands
- has_many :items, through: :items_brands

