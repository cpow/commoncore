require 'spec_helper'

describe "user hit blog page and click to beta sign up" do
  it "should display a form for a user to sign up for the beta" do
    visit posts_path
    page.should have_content "ClassAct Beta"
    click_link "ClassAct Beta"
    fill_in "Name", :with => "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in "Email", :with => Faker::Internet.email
    click_button "Sign up"
  end
end