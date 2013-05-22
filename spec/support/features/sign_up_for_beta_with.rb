module Features
  def sign_up_for_beta_with(name='', email='')
    fill_in "Name", with: name
    fill_in "Email", with: email
    click_button "Sign up"
  end
end
