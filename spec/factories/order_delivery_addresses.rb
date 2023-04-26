FactoryBot.define do
  factory :order_delivery_address do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '新宿区' }
    addresses     { '1-1-1' }
    building      { '新宿ハイツ' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
    user_id       { '1' }
    item_id       { '1' }
  end
end
