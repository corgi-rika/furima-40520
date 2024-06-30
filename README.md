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

<!-- id,created_at,updated_atは自動生成されるカラムなので、DB設計においては削除しましょう。 -->
## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| email              | string   | null: false, unique: true|
| nickname           | string   | null: false              |
| encrypted_password | string   | null: false              |
| full_name          | string   | null: false              |
| full_name_kana     | string   | null: false              |
| birth_year_id      | integer  | null: false              |
| birth_month_id     | integer  | null: false              |
| birth_day_id       | integer  | null: false              |

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| description     | text       | null: false                   |
| category_id     | integer    | null: false                   |
| condition_id    | integer    | null: false                   |
| shipping_fee_id | integer    | null: false                   |
| prefecture_id   | integer    | null: false                   |
| shipping_days_id| integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| user        | references | null: false, foreign_key: true|
| item        | references | null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one    :shipping_info

## shipping_infos テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| purchase      | references | null: false, foreign_key: true|
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| phone_number  |  string    | null: false                   |

- belongs_to :purchase