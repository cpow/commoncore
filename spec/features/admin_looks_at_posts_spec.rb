require 'spec_helper'

feature 'admin looks at posts' do
  scenario 'sees all posts' do
    user = create_logged_in_user
    other_user = create :user
    user.add_role :admin
    create :post, user: user
    visit user_home_index_path(user)

    expect(page).to have_css '.admin_posts'
  end
end
