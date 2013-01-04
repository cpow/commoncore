require 'spec_helper'

describe "user sign in and sign up behavior" do
  describe "GET /" do
    context "when a user has not signed up yet" do
      it "should show sign up link and say 'welcome'" do
        visit root_path
        page.should have_content("Sign up")
      end
    end
  end
end