FactoryBot.define do
  factory :item do
    item_name       { Faker::Lorem.characters(number: 40) }
    detail          { Faker::Lorem.characters(number: 100) }
    item_price      { Faker::Number.within(range: 300..9_999_999) }
    category        { Category.all.sample }
    condition       { Condition.all.sample }
    delivery_charge { DeliveryCharge.all.sample }
    prefecture      { Prefecture.all.sample }
    delivery_day    { DeliveryDay.all.sample }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
