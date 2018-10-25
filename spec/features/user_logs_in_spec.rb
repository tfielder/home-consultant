require 'rails_helper'


describe 'user visits log in page' do
  it "can see log in page" do
    visit "/"

    expect(page).to have_content("Trelora Listing Consultation Tool")
    expect(page).to have_content("Member Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Log in")
  end
  it "cannot log in a user with nil password" do
    visit "/"

    fill_in "Member Email", with: 'steven@trel.co'
    fill_in "Password", with: ''

    click_on "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Invalid email/password. Please try again.")
    expect(page).to have_content("Trelora Listing Consultation Tool")
    expect(page).to have_content("Member Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Log in")
  end
end
