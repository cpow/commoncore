# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  password_and_confirmation = Faker::Base.bothify("Tlsakdjfh3425")
  factory :user do
    name Faker::Name.first_name
    sequence(:email){|n| "user#{n}@factory.com"}
    password password_and_confirmation
    password_confirmation password_and_confirmation
  end
end