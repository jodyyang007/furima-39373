# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false ,Unique:true|
| encrypted_password | string | null: false |
| first name         | string | null: false |
| last name          | string | null: false |
| first name_kana    | string | null: false |
| last name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                | Type       | Options     |
| --------------------- | ---------  | ----------- |
| title                 | string     | null: false |
| category_id           | integer    | null: false |
| condition_id          | integer    | null: false |
| shipping_fee_burden_id| integer    | null: false |
| prefecture_id         | integer    | null: false |
| estimated_shipping _id| integer    | null: false |
| comment               | text       | null: false |
| user                  | references | null: false,foreign_key: true  |


### Association

- belongs_to :user
- has_one : order



## orders テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| item        | references | null: false,foreign_key: true  |
| user        | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping



## shipping テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | references | null: false,foreign_key: true  |
| city          | string     | null: false                    |
| street_address| string     | null: false                    |
| building_name | 
| phone_number  | string     | null: false                    |
| order         | references | null: false,foreign_key: true  |


- belongs_to :order