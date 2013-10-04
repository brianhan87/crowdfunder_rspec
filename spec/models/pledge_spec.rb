# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Pledge do
	let!(:pledge) { FactoryGirl.build(:pledge) }
	
	it "should require a user" do 
		pledge.user = nil

		# Should not be able to save
		pledge.should_not == pledge.save

		expect(pledge).to have(1).errors_on(:user_id)
	end

	it "should require a project" do 
		pledge.project = nil
		pledge.should_not == pledge.save
		expect(pledge).to have(1).errors_on(:project_id)
	end

	it "should require an amount to be an integer" do 
		pledge.amount = 'abc'
		pledge.should_not == pledge.save
		expect(pledge).to have(1).errors_on(:amount)
	end 

	it "should require an amount greater than 0" do 
		pledge.amount = -10
		pledge.should_not == pledge.save
		expect(pledge).to have(1).errors_on(:amount)
	end


end
