# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :core_standard do
    statement "MyText"
    docref_id "MyString"
    guid "MyString"
    uri "MyString"
    related_id "MyString"
  end
end
