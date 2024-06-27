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
## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| id                 | integer  | primary key              |
| email              | string   | null: false, unique: true|
| username           | string   | null: false              |
| encrypted_password | string   | null: false              |
| created_at         | datetime | null: false              |
| updated_at         | datetime | null: false              |

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| id          | integer    | primary key                   |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| price       | integer    | null: false                   |
| user_id     | integer    | null: false, foreign_key: true|
| created_at  | datetime   | null: false                   |
| updated_at  | datetime   | null: false                   |

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| id          | integer    | primary key                   |
| user_id     | integer    | null: false, foreign_key: true|
| item_id     | integer    | null: false,foreign_key: true |
| created_at  | datetime   | null: false                   |
| updated_at  | datetime   | null: false                   |

- belongs_to :user
- belongs_to :item
- has_one    :shipping_info

## shipping_infos テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| id          | integer    | primary key                   |
| purchase_id | integer    | null: false,foreign_key: true |
| postal_code | string     | null: false                   |
| prefecture  | string     | null: false                   |
| city        | string     | null: false                   |
| address     | string     | null: false                   |
| building    | string     |                               |
| phone_number| string     | null: false                   |
| created_at  | datetime   | null: false                   |
| updated_at  | datetime   | null: false                   |

- belongs_to :purchase