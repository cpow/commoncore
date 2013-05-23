require 'spec_helper'
describe "seeing initial data" do
  before(:each) do
    pending "waiting for beta"
    create_logged_in_user
  end

  it "should see initial data after logging in", js: true do
    pending "waiting for beta"
    visit root_path
    page.should have_content("Home")
  end
end
