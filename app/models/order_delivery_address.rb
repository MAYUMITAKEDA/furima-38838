class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too long' }, allow_blank: true
    validates :item_id, presence: { message: 'must exist' }
    validates :user_id, presence: { message: 'must exist' }
  end
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                           building: building, phone_number: phone_number, order_id: order.id)
  end
end
