require "rails_helper"

RSpec.feature "Sign out", :type => :feature do
  scenario "User signs out successfully" do
    visit '/users/sign_in'
    user = FactoryBot.create(:buyer)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content "Signed in successfully"
    click_link 'Log out'
    expect(page).to have_content "Signed out successfully."
  end
end
