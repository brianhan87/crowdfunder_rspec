require 'spec_helper'

describe "UserAuthenticationFlows" do
  describe "when visiting sign in page" do
  	user = FactoryGirl.build(:user)
  	it "should successfully register a user" do 
  		visit "/users/new"
      expect(current_path).to eq(new_user_path)

      # Expect there is a link in the nav to Sign Up
      within(:css, '.navbar') do
        find_link("Sign Up").visible?
      end

      user = FactoryGirl.build(:user) 

      # Fill in the from with the info from user created by FactoryGirl
      fill_in "user[email]", :with => user.email
      fill_in "user[first_name]", :with => user.first_name
      fill_in "user[last_name]", :with => user.last_name
      fill_in "user[password]", :with => user.password
      click_button "Create Account"

      # After submitting the form, should be redirected to root
      expect(current_path).to eq(root_path)
      # While a message says "Account Created"
      # page.should have_content("Account created")
      expect(page).to have_content("Account created")
      # And the nav no longer has a link to Sign Up but Logout
      within(:css, '.navbar') do
        has_no_link?('Sign Up')
        has_link?('Logout')
      end
  	end

  	it "should successfully log in" do
  		visit '/'
  		find('.navbar').has_no_link?('Logout').should be_true
  		user = setup_signed_in_user
  		find('.navbar').has_link?('Logout').should be_true
  	end

  	it "should unsuccessfully log in" do 
  		visit '/sessions/new'

  		fill_in "email", :with => "a@b.com"
  		fill_in "password", :with => "invalid creds"
  		click_button "Log in"
  	end

  	it "should successfully logout" do 
  		user = setup_signed_in_user

  		visit '/'
  		find('.navbar').click_link 'Logout'
  		expect(page).to have_content("Bye")

  		find('.navbar').has_no_link?('Logout')
  	end
  end
end
