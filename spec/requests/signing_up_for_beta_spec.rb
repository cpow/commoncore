require 'spec_helper'

describe "user hit blog page and click to beta sign up" do
  it "should display a form for a user to sign up for the beta" do
    visit posts_path
    page.should have_content "ClassAct Beta"
    click_link "ClassAct Beta"
    fill_in "Name", :with => "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in "Email", :with => Faker::Internet.email
    click_button "Sign up"
    page.should have_content "Thank you for signing up for the classAct beta!"
  end
end

describe "user hit landing page and sign up for beta" do
  it "should display a form for a user to sign up for the beta" do
    visit root_path
    page.should have_content "Sign up for our Beta"
    click_link "Sign up for our Beta"
    fill_in "Name", :with => "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in "Email", :with => Faker::Internet.email
    click_button "Sign up"
    page.should have_content "Thank you for signing up for the classAct beta!"
  end
end

describe "user entering incorrect information" do
  it "should display some errors" do
    visit root_path
    page.should have_content "Sign up for our Beta"
    click_link "Sign up for our Beta"
    fill_in "Name", :with => "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    click_button "Sign up"
    page.should have_content "Email can't be blank"
  end
end
