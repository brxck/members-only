class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password

  def self.digest(input)
    Digest::SHA1.hexdigest(input)
  end

  def remember(user)
    user.remember
    self.remember_token = SecureRandom.urlsafe_base64
    user.update_attribute(:remember_digest, User.digest(remember_token.to_s))
  end
end
