FactoryBot.define do
  factory :order do
    item_name { "Sample Item" }
    cancelled { false }
  end
end