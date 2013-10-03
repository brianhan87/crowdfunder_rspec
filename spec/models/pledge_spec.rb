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


	end
end
