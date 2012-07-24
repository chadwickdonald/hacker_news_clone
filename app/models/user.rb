require 'digest/sha2'

class User < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :password, :confirmation => true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  attr_accessible :password_confirmation, :name, :password, :email
  attr_reader :password
  validate :password_must_be_present

  before_save { |user| user.name = name.downcase }
  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def User.authenticate(email, password)
    if user = find_by_email(email)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end



  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
