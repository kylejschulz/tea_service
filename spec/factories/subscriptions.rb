FactoryBot.define do
  factory :subscription do
    title { Faker::Coffee.blend_name }
    price { 1.5 }
    status { 0 }
    frequency { 1 }
  end
end
