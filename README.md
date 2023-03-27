## usersテーブル

|Colum               |Type    |Options                    |
| ------------------ | ------ | ------------------------- |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## Association
has_many: items
has_many: orders


## itemsテーブル

|Colum               |Type        |Options                         |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| detail             | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| delivery_charge    | integer    | null: false                    |
| ships_from         | integer    | null: false                    |
| days_to_delivery   | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
belongs_to: user
has_one: order


## ordersテーブル

|Colum               |Type        |Options                         |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false  foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Association
belongs_to: user
belongs_to: item
has_one: delivery_address


## delivery_addressesテーブル

|Colum               |Type     |Options      |
| ------------------ | ------- | ----------- |
| postal_code        | string  | null: false |
| prefecture         | integer | null: false |
| city               | string  | null: false |
| addresses          | string  | null: false |
| building           | string  |             |
| phone_number       | string  | null: false |

## Association
belongs_to: order