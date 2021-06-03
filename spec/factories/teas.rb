FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Coffee.notes }
    temperature { 180 }
    brew_time { 1.5 }
  end
end
