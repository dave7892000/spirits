FactoryBot.define do
  factory :user do
    name { "Mickey Mouse" }
    username  { "MickeyMouse" }
    email { "mickeymouse@disney.com" }
    password { "password" }
  end
end