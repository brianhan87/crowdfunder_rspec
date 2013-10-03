require 'spec_helper'

describe "Pledge Listing" do
  describe "when visiting the pledge page" do
  	let!(:project) { FactoryGirl.create(:project) }

    it "should require authenticated user" do

    	visit project_path(project)

    	# expect(@current_user).to eq(nil)
   
    	click_link 'Back this Project'
    	expect(current_path).to eq(login_path)
    	expect(page).to have_content("Please login first.")
    end
  end
end
