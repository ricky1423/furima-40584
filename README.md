# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|  Column    |   Type   |    Options    |
|   ------   |   ----   |  -----------  |
|  nickname  |  string  |  null: false  |
|   email    |  string  |  null: false unique: true |
|  password  |  string  |  null: false  |
| password_confirmation |  string  |  null: false  |
| name_first |  string  |  null: false  |
| name_second |  string  |  null: false  |
| name_first_kana |  string  |  null: false  |
| name_second_kana |  string  |  null: false  |
|  birth_day  |  integer   |  null: false  |

### Association
has_many :items
has_many :purchases


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false  foreign_key: true|
|image|text|null: false|
|name|string|null: false|
|explain|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|shopping_free|string|null:false|
|prefecture|string|null: false|
|schedule|string|null: false|
|price|integer|null: false|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false  foreign_key: true|
|item_id|references|null: false  foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_id|references|null: false  foreign_key: true|
|post_code|integer|null: false|
|prefectures|string|null: false|
|city||string|null: false|
|street||string|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false|

### Association
belongs_to :purchase