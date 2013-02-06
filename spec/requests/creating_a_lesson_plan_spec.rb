require 'spec_helper'
describe "creating a new lesson plan" do
  let(:grade_level){FactoryGirl.create(:grade_level)}
  before(:each) do
    create_logged_in_user
    grade_level
  end

  it "should see link for creating a new lesson plan", js: true do
    visit root_path
    page.should have_link("Create Lesson Plan")
  end

  it "should be able to create lesson plan from the form", js: true do
    visit root_path
    click_link "Create Lesson Plan"
    fill_in "Name", with: Faker::Name.first_name
    click_link('K')
    page.should have_content("Math")
    click_link('Math')
    page.should have_content(grade_level.core_standards.first.dot_notation)
    find(:xpath, "//input[@value='#{grade_level.core_standards.first.id}']").set(true)
    fill_in "Description", with: "this is a description for a lesson plan"
    attach_file('Lesson plan file', "#{Rails.root}/spec/fixtures/files/test_file.txt")
    click_button "Save"
    page.should have_content("Lesson plan was successfully created")
  end
end