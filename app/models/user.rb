class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true

  has_secure_password #adds functionalities to set and authenticate against a BCrypt password
end
