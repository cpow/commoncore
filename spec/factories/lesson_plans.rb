# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson_plan do
    name Faker::Name.first_name
    description "this is a string for content in a description"
    lesson_plan_file {fixture_file_upload("#{Rails.root}/spec/fixtures/files/test_file.txt", 'files/lesson_plan')}
    association :user, :factory => :user
    after(:build){|p| p.core_standards << FactoryGirl.create(:core_standard)}
  end
end
