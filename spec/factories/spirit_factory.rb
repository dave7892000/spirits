FactoryBot.define do
  factory :spirit do
    name { "Bourbon One" }
    abv  { 45 }
    spirit_type { "bourbon" }
    association :user
  end
end