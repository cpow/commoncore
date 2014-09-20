require 'spec_helper'

feature 'User can see all lesson plans' do
  scenario 'from visiting the lesson plan page' do
    user = create_logged_in_user
    visit root_path
    click_on "Lesson Plans"

    expect(page).to have_css '.lesson-plans'
  end
end
