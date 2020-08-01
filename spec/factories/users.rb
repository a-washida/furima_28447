Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = "a1234z"
    password {password}
    password_confirmation {password}
    family_name {Faker::Name.last_name }
    first_name {Faker::Name.first_name}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_day {Faker::Date.in_date_period}
  end
end