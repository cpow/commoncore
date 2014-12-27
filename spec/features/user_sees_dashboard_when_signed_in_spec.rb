require 'spec_helper'
describe "seeing initial data" do
  before(:each) do
    create_logged_in_user
  end

  it "should see initial data after logging in", js: true do
    visit root_path
    page.should have_content("Lesson Plans")
  end
end
