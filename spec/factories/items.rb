FactoryBot.define do
  factory :item do
    name { 'hoge' }
    description { 'hogefuga' }
    category_id { 3 }
    status_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 10 }
    day_until_shipping_id { 3 }
    price { 500 }
    association :user
  end
end
