require 'spec_helper'

feature "viewing the blog" do
  let(:post){FactoryGirl.create(:post)}
  before(:each){post}

  scenario "view posts when hitting landing page" do
    visit posts_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(User.first.name)
  end
end
