require 'spec_helper'

feature 'user sees lesson plan dashboard' do
  scenario 'by seeing a link for the dashboard on home page' do
    create_logged_in_user
    visit root_path

    expect(page).to have_link 'lesson plans'
  end

  scenario 'and clicks on the dashboard link to see lesson plans' do
    lesson_plan = create :lesson_plan
    create_logged_in_user
    visit root_path
    click_on 'lesson plans'

    expect(page).to have_content lesson_plan.name
  end
end
