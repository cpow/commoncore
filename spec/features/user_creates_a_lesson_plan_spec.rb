require 'spec_helper'

feature 'User creates a new lesson plan' do
  scenario 'fills out a form and creates the lesson plan', js: true do
    user = create_logged_in_user
    grade_level = FactoryGirl.create(:grade_level)
    visit new_user_lesson_plan_path(user)

    expect(page).to have_css ".span9"
    fill_in 'Name', with: Faker::Name.first_name
    click_link('K')
    expect(page).to have_content 'Math'
    click_link 'Math'
    expect(page).to have_content(grade_level.core_standards.first.dot_notation)
    find(:xpath, "//input[@value='#{grade_level.core_standards.first.id}']").set(true)
    fill_in_html 'lesson_plan_description', with: 'Test body'
    attach_file 'Lesson plan file', "#{Rails.root}/spec/fixtures/files/test_file.txt"
    click_button 'Save'

    expect(page).to have_content 'Lesson plan was successfully created'
  end
end
