
feature "Signing in" do
  background do
    # User.create(
    # email: "imapratt@nc.rr.com",
    # password: "password",
    # password_confirmation: "password"
    # )
  end

  scenario "Signing in with correct credentials" do
    visit '/users/sign_in'
    fill_in 'Email', with: 'imapratt@nc.rr.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
