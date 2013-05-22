require 'spec_helper'

describe "user sign in and sign up behavior" do
  describe "GET /" do
    context "when a user has not signed up yet" do
      it "should show sign up link and say 'welcome'" do
        pending "waiting for beta to start"
        visit root_path
        page.should have_content("Sign up")
      end
    end

    context "when a user signs up" do
      it "should welcome them to the site" do
        pending "waiting for beta to start"
        user = FactoryGirl.build :user
        visit root_path
        click_link "Sign up"
        fill_in "Name", :with => user.name
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        fill_in "Password confirmation", :with => user.password
        click_button "Sign up"
        page.should have_content("You have signed up successfully")
      end
    end

    context "when a user signs in", js: true do
      it "should go to the home page for a user" do
        pending "waiting for beta to start"
        user = FactoryGirl.create :user
        visit root_path
        click_link "Login"
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        click_button "Sign in"
        page.should have_content("Home")
      end
    end
  end
end