# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string(255)      not null
#  last_name        :string(255)      not null
#  email            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :pledges
  attr_accessible :first_name, :last_name, :email, :password

  validates :first_name, :last_name, :email, :password, presence: true

  def full_name
  	"#{first_name} #{last_name}"
  end
end
