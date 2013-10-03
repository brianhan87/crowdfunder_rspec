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

class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project_id, :user_id

  belongs_to :project
  belongs_to :user

  validates :amount, :user_id, :project_id, presence: true
  validates :amount, numericality: true
end
