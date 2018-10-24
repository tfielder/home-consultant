require 'rails_helper'


describe 'user visits log in page' do
  it "can see log in page" do
    #     As a visitor I visit the login page ('/')
    visit "/"
    # I see the Login/Authentication Screen
    # I see the content “Trelora Listing Consultation Tool”
    expect(page).to have_content("Trelora Listing Consultation Tool")
    # I see a form with Member Email, Password, and a button to log in.
    expect(page).to have_content("Member Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Log in")
  end
  xit "can log in a user " do
    visit "/"

    fill_in "Member Email", with: 'steven@trel.co'
    fill_in "Password", with: 'password'

    click_on "Log in"

    expect(page).to have_content()


  end
end
