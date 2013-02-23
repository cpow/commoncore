require 'spec_helper'
describe "creating a new lesson plan" do
  let(:grade_level){FactoryGirl.create(:grade_level)}
  before(:each) do
    create_logged_in_user
    grade_level
  end

  before(:each){visit root_path}

  context "see link for creating a new lesson plan", js: true do
     specify{page.should have_link("Create Lesson Plan")}
  end

  it "should create lesson plan from the form", js: true do
    click_link "Create Lesson Plan"
    fill_in "Name", with: Faker::Name.first_name
    click_link('K')
    page.should have_content("Math")
    click_link('Math')
    page.should have_content(grade_level.core_standards.first.dot_notation)
    find(:xpath, "//input[@value='#{grade_level.core_standards.first.id}']").set(true)
    fill_in_html 'lesson_plan_description', with: "Test body"
    attach_file('Lesson plan file', "#{Rails.root}/spec/fixtures/files/test_file.txt")
    click_button "Save"
    page.should have_content("Lesson plan was successfully created")
  end
end