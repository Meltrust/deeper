require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Name.first_name }
    fullname { Faker::Name.name }
  end
end
