# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :photos
- has_many :comments

## photos テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category_id

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| photo    | references | null: false, foreign_key: true |

### Association

- belongs_to :photo
- belongs_to :user

