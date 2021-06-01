require "rails_helper"

RSpec.feature "Sign in", :type => :feature do
  scenario "User cannot sign in if not registered" do
    visit '/users/sign_in'
    fill_in 'Email', with: 'jdoe@jdjd.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario "User can sign in with valid credentials" do
    visit '/users/sign_in'
    user = FactoryBot.create(:buyer)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"
  end
end
