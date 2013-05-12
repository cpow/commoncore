# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stripe_connect do
    user_id 1
    uid "something"
    scope "scope"
    stripe_publishable_key "this_is_a_key"
    token "token"
  end
end
