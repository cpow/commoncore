require 'spec_helper'

feature 'user sees gracious greetings' do
  scenario 'from the home page' do
    greeting = create :post, post_type: 'gracious_greeting'
    visit posts_path(post_type: 'gracious_greeting')

    expect(page).to have_content greeting.title
  end
end
