# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :core_standard do
    statement "this is a statment for test core standard"
    docref_id "ABC123DOCREFID"
    guid "ABC123GUID"
    uri "https://google.com"
    related_id "something here"
  end
end
