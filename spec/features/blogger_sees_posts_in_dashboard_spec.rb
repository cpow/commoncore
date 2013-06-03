require 'spec_helper'

feature 'blogger sees posts in dashboard' do
  scenario 'can view all their posts' do
    user = create_logged_in_blogger
    post = create :post, user: user
    visit user_home_index_path(user)

    expect(page).to have_css ".user_#{user.id}_posts"
  end
end
