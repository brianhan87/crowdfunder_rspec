# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  teaser      :string(255)
#  user_id     :integer
#  description :text
#  goal        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
  attr_accessible :description, :goal, :teaser, :title

  validates :title, presence: true, length: { maximum: 100 }
  validates :teaser, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :goal, presence: true, numericality: { greater_than: 0, allow_blank: true }
end
