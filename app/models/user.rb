class User < ActiveRecord::Base
  has_many :links
  attr_accessible :username, :password, :password_confirmation, :id
  validates_uniqueness_of :username

  has_secure_password
  # validates :password, :length => 6
  # test
  # test again

  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
