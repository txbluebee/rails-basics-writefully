class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,}

  before_create :generate_confirmaion_token

  def generate_confirmaion_token
    self.confirmation_token = SecureRandom.hex
  end
end
