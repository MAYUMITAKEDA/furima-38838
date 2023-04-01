FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    family_name_kana      {Faker::Japanese::Name.last_name.yomi}
    first_name_kana       {Faker::Japanese::Name.first_name.yomi}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2018-12-31')}
  end
end