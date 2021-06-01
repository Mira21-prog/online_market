require "rails_helper"
RSpec.feature "Sign Up", :type => :feature do
  let(:buyer) { FactoryBot.create(:buyer) }
  
  scenario 'user can sign up with valid email address/password' do
    visit '/users/sign_up'
    fill_in "Email", with: 'jdoesjsj@jdjd.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Phone number', with: '123456789'
    fill_in 'First name', with: 'Solomia'
    fill_in 'Last name', with: 'Bob'
    click_on 'Sign Up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'email is already exist' do
    visit '/users/sign_up'
    fill_in "Email", with: buyer.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Phone number', with: '123456789'
    fill_in 'First name', with: 'Solomia'
    fill_in 'Last name', with: 'Bob'
    click_on 'Sign Up'
    expect(page).to have_content "Email has already been taken"
  end

  scenario 'password is empty' do
    visit '/users/sign_up'
    fill_in "Email", with: 'j22u2uhss@jdjd.com'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    fill_in 'Phone number', with: '123456789'
    fill_in 'First name', with: 'Solomia'
    fill_in 'Last name', with: 'Bob'
    click_on 'Sign Up'
    expect(page).to have_content "Password can't be blank"
  end
end
