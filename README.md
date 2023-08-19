# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false ,Unique:true|
| encrypted_password | string | null: false |
| full name          | string | null: false |
| full name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column              | Type     | Options     |
| ------------------ | ------    | ----------- |
| title              | string    | null: false |
| category           | string    | null: false |
| condition          | string    | null: false |
| shipping_fee_burden| string    | null: false |
| prefecture         | string    | null: false |
| estimated_shipping | string    | null: false |



### Association

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
| postal_code   | text       | null: false                    |
| prefecture    | text       | null: false                    |
| city          | text       | null: false                    |
| street_address| text       | null: false                    |
| building_name | 
| phone_number  | text       | null: false                      |
| user          | references | null: false,foreign_key: true    |
| order         | references | null: false,foreign_key: true    |
| item          | references | null: false,foreign_key: true    |


- belongs_to :order