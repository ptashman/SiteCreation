require 'spec_helper'

describe "Sites" do
  before do
    @site = FactoryGirl.create(:site)
    @user = FactoryGirl.create(:user)
  end

  describe "navigation_within_site" do
    before { visit site_welcome_path(site_id: @site.id) }
    it "should stay within the page throughout normal navigation" do
      click_on "Sign up now!"
      expect(page).to have_content("Confirmation")
      expect(current_path).to include("/sites/")
      page.fill_in 'Name', :with => 'Joe User'
      page.fill_in 'Email', :with => 'joe@example.com'
      page.fill_in 'Password', :with => 'password'
      page.find_field('user_password_confirmation').set('password')
      click_on "Create my account"
      expect(page).to have_content("Joe User")
      expect(page).to have_content("followers")
      expect(page).to have_content("following")
      expect(current_path).to include("/sites/")
      click_on "Microposts"
      expect(page).to have_content("Micropost Feed")
      expect(current_path).to include("/sites/")
      click_on "Account"
      click_on "Profile"
      expect(page).to have_content("Joe User")
      expect(page).to have_content("followers")
      expect(page).to have_content("following")
      expect(current_path).to include("/sites/")
      click_on "Users"
      expect(page).to have_content("All users")
      expect(current_path).to include("/sites/")
      click_on "Home"
      expect(page).to have_content("Sign up now!")
      expect(current_path).to include("/sites/")
      click_on "Account"
      click_on "Settings"
      expect(page).to have_content("Update your profile")
      expect(current_path).to include("/sites/")
      page.fill_in 'Name', :with => 'Bob User'
      page.fill_in 'Email', :with => 'bob@example.com'
      page.fill_in 'Password', :with => 'password'
      page.find_field('user_password_confirmation').set('password')
      click_on "Save changes"
      expect(page).to have_content("Bob User")
      expect(page).to have_content("followers")
      expect(page).to have_content("following")
      expect(current_path).to include("/sites/")
      click_on "Microposts"
      expect(page).to have_content("Micropost Feed")
      expect(current_path).to include("/sites/")
      click_on "Account"
      click_on "Profile"
      expect(page).to have_content("Bob User")
      expect(page).to have_content("followers")
      expect(page).to have_content("following")
      expect(current_path).to include("/sites/")
      click_on "Users"
      expect(page).to have_content("All users")
      expect(current_path).to include("/sites/")
      click_on "Home"
      expect(page).to have_content("Sign up now!")
      expect(current_path).to include("/sites/")
    end
  end
end
