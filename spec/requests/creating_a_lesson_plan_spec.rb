require 'spec_helper'
describe "creating a new lesson plan" do
  before(:each){create_logged_in_user}
 
  it "should see link for creating a new lesson plan", js: true do
    visit root_path
    page.should have_link("Create Lesson Plan")
  end

  it "should be able to create lesson plan from the form" do
    lesson_plan = FactoryGirl.build :lesson_plan
    visit root_path
    click_link "Create Lesson Plan"
    fill_in "Name", with: Faker::Name.first_name
    fill_in "Description", with: "this is a description for a lesson plan"
    attach_file('Lesson plan file', "#{Rails.root}/spec/fixtures/files/test_file.txt")
    click_button "Save"
    page.should have_content("Lesson plan was successfully created")
  end
end