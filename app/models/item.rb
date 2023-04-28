class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :item_price, presence: true
  validates :item_price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :item_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :image, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id,
            presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
