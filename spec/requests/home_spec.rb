require 'rails_helper'

describe "Home" do

  # it "displays users when searching" do
  #   visit root_path
  #   fill_in "username", with:"murraycatto"
  #   click_button "Search!"
  #   expect(page).to have_content('murraycatto')
  # end

  it "displays a user" do
    visit github_user_path("murraycatto")
    expect(page).to have_content('Murray Catto')
    expect(page).to have_content('Favorite Language')
  end
end
