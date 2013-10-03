require 'spec_helper'

describe "Pledge Listing" do
  describe "when visiting the pledge page" do
  	let!(:project) { FactoryGirl.create(:project) }

    it "should require authenticated user" do
    	click_link 'Back this Project'
    end
  end
end
