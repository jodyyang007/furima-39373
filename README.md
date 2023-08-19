# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false ,Unique:true|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| address            | text   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column     | Type      | Options                       |
| ------     | ------    | ----------------------------- |
| title      | string    | null: false                   |
| category   | string    | null: false                   |
| price      | integer   | null: false                   |
| user       | references| null: false,foreign_key: true |


### Association

- has_one : order



## orders テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| info        | text       | null: false                    |
| price       | integer    | null: false                    |
| item        | references | null: false,foreign_key: true  |
| user        | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping



## shipping テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| address     | text       | null: false                    |
| user        | references | null: false,foreign_key: true  |
| order       | references | null: false,foreign_key: true  |
| item        | references | null: false,foreign_key: true  |


- belongs_to :order