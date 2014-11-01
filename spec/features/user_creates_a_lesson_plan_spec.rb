require 'spec_helper'

feature 'User creates a new lesson plan' do
  scenario 'fills out a form and creates the lesson plan', js: true do
    user = create_logged_in_user
    grade_level = FactoryGirl.create(:grade_level)
    visit new_user_lesson_plan_path(user)

    fill_in 'Name', with: Faker::Name.first_name
    click_link('K')

    expect(page).to have_content 'Math'
    click_link 'Math'

    expect(page).to have_content(grade_level.core_standards.first.dot_notation)
    find(:xpath, "//input[@value='#{grade_level.core_standards.first.id}']").set(true)
    fill_in_html 'lesson_plan_description', with: 'Test body'
    fill_in 'Agenda', with: 'something'
    fill_in 'Materials', with: 'something'
    fill_in 'Objectives', with: 'something'
    attach_file 'Lesson plan file', "#{Rails.root}/spec/fixtures/files/test_file.txt"
    click_button 'Save'

    expect(page).to have_content 'Lesson plan was successfully created'
  end

  scenario 'user looks at a lesson plan\'s show page' do
    user = create_logged_in_user
    FactoryGirl.create(:grade_level)
    lesson_plan = create :lesson_plan, user: user
    visit user_lesson_plans_path(user)

    within("ul.list-group") do
      click_on 'Show'
    end

    expect(page).to have_content(lesson_plan.core_standards.first.dot_notation)
  end

  scenario 'user can edit a lesson plan' do
    user = create_logged_in_user
    FactoryGirl.create(:grade_level)
    create :lesson_plan, user: user
    visit user_lesson_plans_path(user)

    within("ul.list-group") do
      click_on 'Edit'
    end

    fill_in "Agenda", with: 'something else'
    click_on "Save"
    expect(page).to have_content('successful')
  end
end
