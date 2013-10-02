class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  attr_accessible :first_name, :last_name, :email, :password

  validates :first_name, :last_name, :email, :password, presence: true

  def full_name
  	"#{first_name} #{last_name}"
  end
end
