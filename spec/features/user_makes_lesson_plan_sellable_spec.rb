require 'spec_helper'
feature "making lesson plan sellable" do
  pending 'navigating to lesson plan index' do
    user = create_logged_in_user
    stripe_connect = create :stripe_connect, user_id: user.id
    lesson_plan = create :lesson_plan, user: user
    visit user_lesson_plans_path(user)

    expect(page).to have_content LessonPlan.first.name
    expect(page).to have_link "Sell Lesson Plan"

    click_link "Sell Lesson Plan"
    fill_in "Price", with: "1.00"
    click_button 'Create Product'
    expect(page).to have_content "Product was successfully created"
  end
end
