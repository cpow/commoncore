# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grade_level do
    level "K"
    after(:create){|l| FactoryGirl.create(:level, grade_level_id: l.id, core_standard_id: FactoryGirl.create(:core_standard).id)}
  end
end
