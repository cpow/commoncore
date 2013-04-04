require 'spec_helper'
describe "making lesson plan sellable" do
  let(:lesson_plan){FactoryGirl.create(:lesson_plan, user: @user)}
  before(:each) do
    @user = create_logged_in_user
    lesson_plan
  end

  before(:each){visit user_lesson_plans_path(User.first)}

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