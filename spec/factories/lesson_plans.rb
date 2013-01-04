# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson_plan do
    name Faker::Name.first_name
    description "this is a string for content in a description"
  end
end
