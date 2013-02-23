require 'spec_helper'
describe "logging in and viewing the blog" do
  let(:post){FactoryGirl.create(:post)}
  before(:each){post}

  context "view posts when hitting landing page", js: true do
    before(:each){visit root_path}

    specify{page.should have_content("MyPost")}
    specify{page.should have_content("#{User.first.name}")}
  end
end