FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.characters(number: 40) }
    detail             { Faker::Lorem.characters(number: 100) }
    item_price         { Faker::Number.within(range: 300..9_999_999) }
    category_id        { Faker::Number.between(from: 2, to: 10) }
    condition_id       { Faker::Number.between(from: 2, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id    { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
