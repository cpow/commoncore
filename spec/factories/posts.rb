# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyPost"
    body "this is some text for a body"
    after(:build){|p| p.user = FactoryGirl.create(:user)}
  end
end
