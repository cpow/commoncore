require 'spec_helper'
describe "making lesson plan sellable" do
  let(:user){create_logged_in_user}
  let(:stripe_connect){FactoryGirl.create(:stripe_connect, user_id: user.id)}
  let(:lesson_plan){FactoryGirl.create(:lesson_plan, user: user)}

  before(:each) do
    lesson_plan
    stripe_connect
  end

  before(:each){visit user_lesson_plans_path(user)}

  it "should show us the index of lesson plans" do
    page.should have_content("Listing lesson_plans")
  end

  it "should have our lesson plan in the list" do
    page.should have_content(LessonPlan.first.name)
  end

  it "should have a link to make sellable" do
    page.should have_link("Sell Lesson Plan")
  end
end