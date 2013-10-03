require 'spec_helper'

describe "Pledge Listing" do
  describe "when visiting the pledge page" do
  	before(:each) do 
  		@project = FactoryGirl.create(:project) 
  	end

    it "should require authenticated user" do

    	visit project_path(@project)

    	# expect(@current_user).to eq(nil)
   
    	click_link 'Back this Project'
    	expect(current_path).to eq(login_path)
    	expect(page).to have_content("Please login first.")
    end

    it "authenticated user can pledge valid amount" do 
    	user = setup_signed_in_user

    	visit project_path(@project)

    	click_link 'Back this Project'

    	expect(current_path).to eq(new_product_pledge_path(@project))
    	expect(Pledge.count).to eq(0)

    	fill_in 'pledge[amount]', with: 100
    	click_button 'Pledge Now'

    	expect(current_path).to eq(project_path(@project))
    	expect(page).to have_content("Thanks for pledging")

    	# Verify that the pledge was created with the right attrs
    	pledge = Pledge.order(:id).last

    	expect(pledge.user).to eq(user)
    	expect(pledge.project).to eq(@project)
    	expect(pledge.amount).to eq(100)
    end
  end
end
