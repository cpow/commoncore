require 'spec_helper'

feature 'blogger creates a new post' do
  scenario 'post gets created and saved with attributes' do
    user = create_logged_in_blogger
    visit new_user_post_path(user)

    fill_in 'Title', with: 'This is a post title'
    fill_in_html 'post_body', with: 'This is a post body'
    click_button 'Publish'

    expect(page).to have_content 'created'
  end

  scenario 'user without blogger role cannot create post' do
    user = create_logged_in_user
    visit new_user_post_path(user)

    expect(page).to have_content 'authorized'
  end

  scenario 'and edits a post if they so want' do
    user = create_logged_in_blogger
    blog_post = create :post, user: user
    visit edit_user_post_path(user, blog_post)

    fill_in 'Title', with: 'this is something else'
    click_button 'Publish'

    expect(page).to have_content 'successful'
  end
end
