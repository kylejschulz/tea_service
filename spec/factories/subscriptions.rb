FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { 1.5 }
    status { 1 }
    frequency { 1 }
  end
end
