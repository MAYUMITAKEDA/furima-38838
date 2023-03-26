## usersテーブル

|Colum               |Type     |Options                    |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| name_kana          | string  | null: false               |
| nickname           | string  | null: false               |
| birthday           | integer | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

## Association
has_many: items
has_many: orders


## itemsテーブル

|Colum               |Type        |Options                    |
| ------------------ | ---------- | ------------------------- |
| item_name          | string     | null: false               |
| detail             | text       | null: false               |
| item_price         | integer    | null: false               |
| user               | references | null: false, unique: true |

## Association
belongs_to: user
has_one: order


## ordersテーブル

|Colum               |Type        |Options                    |
| ------------------ | ---------- | ------------------------- |
| item               | string     | null: false               |
| user               | references | null: false, unique: true |

## Association
belongs_to: user
belongs_to: item
has_one: delivery_address


## delivery_addressテーブル

|Colum               |Type     |Options      |
| ------------------ | ------- | ----------- |
| postal_code        | integer | null: false |
| city               | string  | null: false |
| addresses          | string  | null: false |
| building           | string  | null: false |
| phone_number       | integer | null: false |

## Association
belongs_to: order