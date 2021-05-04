require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!(first_name: 'First', last_name: 'Last', email: 'test@mail.com', password: 'password', password_confirmation: 'password')
  end

  scenario "user can log in" do

    visit root_path
    
    # click login button
    find('a[href="/login"]').click

    # verify we're on login page
    expect(page).to have_content('Email:')
    expect(page).to have_content('Password:')

    # fill out form
    fill_in 'email', with: 'test@mail.com'
    fill_in 'password', with: 'password'

    click_button('Login')

    # check we're redirected to root
    expect(page).to have_current_path '/'

    # check we're logged in
    expect(page).to have_content 'test@mail.com'
    expect(page).to have_content 'Logout'

  end

end
