# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    user_id 1
    productable_type "MyString"
    productable_id 1
    price "9.99"
  end
end
