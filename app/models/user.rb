class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  validates_uniqueness_of :username

  has_secure_password
  # validates :password, :length => 6

  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
