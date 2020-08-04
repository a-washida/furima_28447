FactoryBot.define do
  factory :order_destination do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '大阪' }
    address { '北区' }
    building_name { '柳ビル' }
    phone_number { '08011112222' }
  end
end
