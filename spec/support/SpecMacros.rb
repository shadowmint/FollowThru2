module SpecMacros

  ## Log a user into the site with the given password or fail
  def login email, password
    visit '/users/sign_in'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'Sign in'
    visit '/users/edit'
    page.should have_content('Edit User')
  end
end
