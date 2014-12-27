require 'spec_helper'

feature 'Guest signs up for beta from homepage' do
  scenario 'enters correct information' do
    pending 'no longer in beta mode'
    visit root_path
    expect(page).to have_content 'Sign up for our Beta'
    click_link 'Sign up for our Beta'
    sign_up_for_beta_with 'Chris Power', 'cpow85@gmail.com'
    expect(page).to have_content "Thank you for signing up for the classAct beta!"
    Lead.all.count.should eql(1)
  end

  scenario 'enters incorrect information' do
    pending 'no longer in beta mode'
    visit root_path
    expect(page).to have_content "Sign up for our Beta"
    click_link 'Sign up for our Beta'
    sign_up_for_beta_with 'Chris Power'
    expect(page).to have_content "Email can't be blank"
  end
end
