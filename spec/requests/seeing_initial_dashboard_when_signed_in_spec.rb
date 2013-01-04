require 'spec_helper'
describe "seeing initial data" do
  before(:each){create_logged_in_user}
 
  it "should see initial data after logging in", js: true do
    visit root_path
    page.should have_content("Home")
  end
end