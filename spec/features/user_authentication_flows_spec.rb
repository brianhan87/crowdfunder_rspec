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

  		fill_in "user[email]", :with => user.email
  		fill_in "user[first_name]", :with => user.first_name
  		fill_in "user[last_name]", :with => user.last_name
  		fill_in "user[password]", :with => user.password
      click_button "Create Account"
 			
 			expect(current_path).to eq(root_path)
 			expect(page).to have_content("Account created")

 			within(:css, '.navbar') do 
 				has_no_link?('Sign Up')
 				has_link?("Logout")
 			end
  	end

  	it "should fail registration" do 
  		visit "/users/new"
  		fill_in "user[email]", :with => user.email
  		click_button "Create Account"
  		expect(current_path).to eq(users_path)
  		expect(page).to have_no_content("Account created")
  		within(:css, ".alert") do 
  			have_content("Try again")
  		end
  	end
  end
end
