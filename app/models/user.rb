class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :links
  attr_accessible :username, :password, :password_confirmation, :id
=======
  attr_accessible :username, :password, :password_confirmation
>>>>>>> 69995a00200e618b66719ca8b91fcaf22657e451
  validates_uniqueness_of :username

  has_secure_password
  # validates :password, :length => 6

  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end
