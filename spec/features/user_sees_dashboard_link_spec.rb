require 'spec_helper'

feature 'user sees link for dashboard' do
  scenario 'when signing in as a user' do
    user = create_logged_in_user
    visit root_path

    expect(page).to have_link 'Dashboard'
  end
end
