FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'test' }
    category_id { 2 }
    shipping_fee_id { 2 }
    condition_id { 2 }
    shipping_day_id { 2 }
    prefecture_id { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end
