require 'spec_helper'

feature 'blogger sees posts in dashboard' do
  scenario 'can view all their posts' do
    user = create_logged_in_blogger
    create :post, user: user
    visit user_home_index_path(user)

    expect(page).to have_css ".user_#{user.id}_posts"
  end

  scenario 'only sees their posts' do
    user = create_logged_in_blogger
    other_user = create :user
    create :post, user: other_user
    visit user_home_index_path(user)

    expect(page).to_not have_css ".user_#{other_user.id}_posts"
    expect(page).to_not have_css '.admin_posts'
  end
end
