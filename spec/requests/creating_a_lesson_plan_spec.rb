require 'spec_helper'
describe "creating a new lesson plan" do
  before(:each){create_logged_in_user}
 
  it "should see link for creating a new lesson plan", js: true do
    visit root_path
    page.should have_link("Create Lesson Plan")
  end

  it "should bring a user to create lesson plan form" do
    lesson_plan = FactoryGirl.build :lesson_plan
    visit root_path
    click_link "Create Lesson Plan"
  end
end